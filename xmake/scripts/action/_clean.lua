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
-- @file        _clean.lua
--

-- define module: _clean
local _clean = _clean or {}

-- load modules
local clean     = require("base/clean")
local config    = require("base/config")

-- done the given config
function _clean.done()

    -- the options
    local options = xmake._OPTIONS
    assert(options)

    -- clean the current target
    if not clean.remove(options.target) then
        return false
    end

    -- trace
    print("clean ok!")
 
    -- ok
    return true
end

-- return module: _clean
return _clean
