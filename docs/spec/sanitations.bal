// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.org).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import ballerina/lang.regexp;

type Specification record {
    map<Path> paths;
    Components components;
};

type Path record {
    Get get?;
    Post post?;
};

type Get record {
    string summary?;
    string description?;
    string[] tags?;
    map<ResponseCode> responses?;
};

type Post record {
    string summary?;
    string description?;
    string[] tags?;
    json requestBody?;
    map<ResponseCode> responses?;
};

type ResponseCode record {
    string description?;
    map<ResponseHeader> content?;
};

type ResponseHeader record {
    ResponseSchema schema?;
};

type ResponseSchema record {
    string title?;
    string 'type?;
    string schemaType?;
};

type Components record {
    map<json> schemas;
};

const SPEC_PATH = "openapi.json";
const REQUEST_BODY = "requestBody";

public function main() returns error? {
    json openAPISpec = check io:fileReadJson(SPEC_PATH);
    Specification spec = check openAPISpec.cloneWithType(Specification);

    string sanitizedSpec = check sanitize(spec);
    check io:fileWriteString(SPEC_PATH, sanitizedSpec);
}

function sanitize(Specification spec) returns string|error {
    Specification updatedSpec = removeV1PrefixFromPath(spec);
    updatedSpec = removeRequestBodyFromHttpGet(spec);
    string schemaString = sanitizeSchemaNames(updatedSpec);
    return schemaString;
}

function removeV1PrefixFromPath(Specification spec) returns Specification {
    map<Path> paths = spec.paths;
    map<Path> updatedPaths = {};
    foreach var ['key, value] in paths.entries() {
        string updatedKey = re `/v1`.replace('key, "");
        updatedPaths[updatedKey] = value;
    }

    spec.paths = updatedPaths;
    return spec;
}

// Improvement required for the OpenAPI tool side is captured in the following issue.
// https://github.com/ballerina-platform/ballerina-library/issues/5077
function removeRequestBodyFromHttpGet(Specification spec) returns Specification {
    map<Path> paths = spec.paths;
    foreach var ['key, value] in paths.entries() {
        Get? get = value.get;
        if get is () {
            continue;
        }

        if !get.hasKey(REQUEST_BODY) {
            continue;
        }

        _ = get.remove(REQUEST_BODY);
        value.get = get;
        paths['key] = value;
    }
    return spec;
}

// Improvement required from the OpenAPI tool side is captured in the following issue.
// https://github.com/ballerina-platform/ballerina-library/issues/6578
function sanitizeSchemaNames(Specification spec) returns string {
    map<json> updatedSchemas = {};
    map<string> updatedNames = {};

    foreach [string, json] [schemaName, schema] in spec.components.schemas.entries() {
        if schemaName.length() == 0 {
            updatedSchemas[schemaName] = schema;
            continue;
        }
        
        string firstLetter = schemaName.substring(0, 1).toUpperAscii();
        string newSchemaName = string `${firstLetter}${schemaName.substring(1)}`;
        updatedNames[schemaName] = newSchemaName;
        updatedSchemas[newSchemaName] = schema;
    }
    spec.components.schemas = updatedSchemas;

    string updatedSpec = spec.toJsonString();
    foreach [string, string] [oldName, newName] in updatedNames.entries() {
        regexp:RegExp oldRegex = re `#/components/schemas/${oldName}"`;
        regexp:Replacement replacement = string `#/components/schemas/${newName}"`;
        updatedSpec = oldRegex.replaceAll(updatedSpec, replacement);
    }

    return updatedSpec;
}
