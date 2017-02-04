--!The Make-like Build Utility based on Lua
--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2017, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        compiler.lua
--

-- define module
local compiler = compiler or {}

-- load modules
local io        = require("base/io")
local path      = require("base/path")
local utils     = require("base/utils")
local table     = require("base/table")
local string    = require("base/string")
local option    = require("base/option")
local tool      = require("tool/tool")
local builder   = require("tool/builder")
local config    = require("project/config")
local sandbox   = require("sandbox/sandbox")
local language  = require("language/language")
local platform  = require("platform/platform")

-- get the language of compiler
function compiler:_language()

    -- get it
    return self._LANGUAGE
end

-- get the source flags
function compiler:_sourceflags()

    -- get it
    return self._SOURCEFLAGS
end

-- add flags from the configure 
function compiler:_addflags_from_config(flags)

    -- done
    for _, sourceflag in ipairs(self:_sourceflags()) do
        table.join2(flags, config.get(sourceflag))
    end
end

-- add flags from the target 
function compiler:_addflags_from_target(flags, target)

    -- add the target flags 
    for _, sourceflag in ipairs(self:_sourceflags()) do
        table.join2(flags, self:_mapflags(target:get(sourceflag)))
    end

    -- for target options? 
    if target.options then

        -- add the flags for the target options
        for _, opt in ipairs(target:options()) do

            -- add the flags from the option
            self:_addflags_from_target(flags, opt)
        end
    end
end

-- add flags from the platform 
function compiler:_addflags_from_platform(flags)

    -- add flags 
    for _, sourceflag in ipairs(self:_sourceflags()) do
        table.join2(flags, platform.get(sourceflag))
    end
end

-- add flags from the compiler 
function compiler:_addflags_from_compiler(flags, kind)

    -- done
    for _, sourceflag in ipairs(self:_sourceflags()) do

        -- add compiler.xxflags
        table.join2(flags, self:get(sourceflag))

        -- add compiler.kind.xxflags
        if kind ~= nil and self:get(kind) ~= nil then
            table.join2(flags, self:get(kind)[sourceflag])
        end
    end
end

-- load the compiler from the given source kind
function compiler.load(sourcekind)

    -- check
    assert(sourcekind)

    -- get it directly from cache dirst
    compiler._INSTANCES = compiler._INSTANCES or {}
    if compiler._INSTANCES[sourcekind] then
        return compiler._INSTANCES[sourcekind]
    end

    -- new instance
    local instance = table.inherit(compiler, builder)

    -- load the compiler tool from the source kind
    local result, errors = tool.load(sourcekind)
    if not result then 
        return nil, errors
    end
    instance._TOOL = result
        
    -- load the compiler language from the source kind
    result, errors = language.load_sk(sourcekind)
    if not result then 
        return nil, errors
    end
    instance._LANGUAGE = result

    -- init named flags
    instance._NAMEDFLAGS = result:namedflags()["compiler"]

    -- init source flags
    instance._SOURCEFLAGS = table.wrap(result:sourceflags()[sourcekind])

    -- save this instance
    compiler._INSTANCES[sourcekind] = instance

    -- ok
    return instance
end

-- compile the source file
function compiler:compile(sourcefile, objectfile, incdepfile, target)

    -- compile it
    return sandbox.load(self:_tool().compile, sourcefile, objectfile, incdepfile, (self:compflags(target)))
end

-- get the compile command
function compiler:compcmd(sourcefile, objectfile, target)

    -- get it
    return self:_tool().compcmd(sourcefile, objectfile, (self:compflags(target)))
end

-- get the compling flags
function compiler:compflags(target)

    -- no target?
    if not target then
        return "", {}
    end

    -- get the target key
    local key = tostring(target)

    -- get it directly from cache dirst
    self._FLAGS = self._FLAGS or {}
    local flags_cached = self._FLAGS[key]
    if flags_cached then
        return flags_cached[1], flags_cached[2]
    end

    -- add flags from the configure 
    local flags = {}
    self:_addflags_from_config(flags)

    -- add flags from the target 
    self:_addflags_from_target(flags, target)

    -- add flags (named) from language
    self:_addflags_from_language(flags, target)

    -- add flags from the platform 
    self:_addflags_from_platform(flags)

    -- add flags from the compiler 
    self:_addflags_from_compiler(flags, target:get("kind"))

    -- remove repeat
    flags = table.unique(flags)

    -- concat
    local flags_str = table.concat(flags, " "):trim()

    -- save flags
    self._FLAGS[key] = {flags_str, flags}

    -- get it
    return flags_str, flags 
end

-- return module
return compiler
