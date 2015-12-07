--!The Automatic Cross-platform Build Tool
-- 
-- XMake is free software; you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation; either version 2.1 of the License, or
-- (at your option) any later version.
-- 
-- XMake is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public License
-- along with XMake; 
-- If not, see <a href="http://www.gnu.org/licenses/"> http://www.gnu.org/licenses/</a>
-- 
-- Copyright (C) 2009 - 2015, ruki All rights reserved.
--
-- @author      ruki
-- @file        _template.lua
--

-- define module: _template
local _template = _template or {}

-- load modules
local io        = require("base/io")
local os        = require("base/os")
local path      = require("base/path")
local utils     = require("base/utils")
    
-- init the template description
_template.description = "The Static Library (tbox)"

-- done the template file
function _template.done(targetname, projectdir, packagesdir)

    -- check
    assert(targetname and projectdir and packagesdir)

    -- replace the target name
    io.gsub(projectdir .. "/xmake.lua", "%[targetname%]", targetname) 
    io.gsub(projectdir .. "/src/demo/main.c", "%[targetname%]", targetname) 
    io.gsub(projectdir .. "/src/demo/xmake.lua", "%[targetname%]", targetname) 
    io.gsub(projectdir .. "/src/[targetname]/xmake.lua", "%[targetname%]", targetname) 

    -- rename the target directory
    if not os.mv(projectdir .. "/src/[targetname]", projectdir .. "/src/" .. targetname) then
        -- errors
        utils.error("rename the target directory failed!")
        return false
    end

    -- copy the tbox.pkg 
    if not os.cp(packagesdir .. "/tbox.pkg/", projectdir .. "/pkg/tbox.pkg") then
        -- errors
        utils.error("copy tbox.pkg failed!")
        return false
    end

    -- copy the base.pkg 
    if not os.cp(packagesdir .. "/base.pkg/", projectdir .. "/pkg/base.pkg") then
        -- errors
        utils.error("copy base.pkg failed!")
        return false
    end

    -- ok
    return true
end

-- return module: _template
return _template
