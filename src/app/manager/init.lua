--
-- Author: ping
-- Date: 2015-04-10 11:20:51
--
local Manager = {};
require("scripts/manager/UI_CONFIG")
Manager.KeypadManager = require "scripts/manager/KeypadManager"
Manager.LoadTaskManager = require "scripts/manager/LoadTaskManager"

-- require "scripts/UI/test/TestManager"
return Manager;