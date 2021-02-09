--
-- Author: ping
-- Date: 2015-04-21 17:17:07
-- 手机电脑按钮响应管理
local Keypad = {}
local _init = false;
local _sysList = {}
function Keypad:init( )
	if _init then return end
	local function onKeyReleased(keyCode, event)
	    self:OnKeyEven(keyCode, event)
	end

	local listener = cc.EventListenerKeyboard:create()
	listener:registerScriptHandler(onKeyReleased, cc.Handler.EVENT_KEYBOARD_RELEASED )
	if GameWorld.Layer:get_layer_ui() then
		local eventDispatcher = GameWorld.Layer:get_layer_ui():getEventDispatcher()
		eventDispatcher:addEventListenerWithSceneGraphPriority(listener, GameWorld.Layer:get_layer_ui())
	end
    

	_init = true;
end

--注册系统响应
function Keypad:RegSYS( _sys )
	if _sysList[_sys.sysType] == nil then
		_sysList[_sys.sysType] = _sys;
	end
end

function Keypad:unRegSYS( _sys )
	-- body
	_sysList[_sys.sysType] = nil;
end

function Keypad:OnKeyEven(keyCode, event)
	for k,v in pairs(_sysList) do
		v:OnKeyEven(keyCode, event)
	end
end
Keypad:init( )

return Keypad;