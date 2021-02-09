--ui管理器
--2015.4.11 by ping
GameUIManager = super_class.GameUIManager()
local _ui_windows_create = {}				-- 记录已创建窗口
setmetatable(_ui_windows_create, {__mode = "kv"});
local _ui_windows_loading = {}				-- 正在加载的窗口
setmetatable(_ui_windows_loading, {__mode = "kv"});
local _ui_windows_shown = {}				-- 记录正在显示的窗口
setmetatable(_ui_windows_shown, {__mode = "kv"});
local _ui_create_table = _ui_create_table 	--UI_CONFIG定义了

-- UI根节点
local _ui_root = nil
local LayerManager = GameWorld.Layer;
local KeypadManager  = import(".KeypadManager")

function GameUIManager:__init( )
	-- cclog("GameUIManager:__init")
	self.sysType = "UI";
	if _ui_root ~= nil then
		cclog("UI manager has been initialized!")
		return
	end
	_ui_root = LayerManager:get_layer_ui();

	KeypadManager:RegSYS(self)
end

-- 创建窗口
-- 会申请内存，但不会渲染
function GameUIManager:create_window( ui_id )
	local obj = _ui_windows_create[ui_id]
	if obj ~=nil and obj:getSTATE() ~= "ONLOAD" then return  end --不重复创建
	local window = obj:create( ui_id );
	_ui_windows_create[ui_id] = window;
	return window;
end

-- 异步加载窗口图片资源
function GameUIManager:load_windowRes( ui_id,callback )
	local obj = _ui_windows_create[ui_id];
	if obj ~=nil then --不重复创建
		callback()
		return
	end
	if obj == nil then
		if DEBUG == 2 then
			package.loaded[_ui_create_table[ui_id]] = nil
		end
		obj = require(_ui_create_table[ui_id]):new()
		_ui_windows_loading[ui_id] = ui_id
		_ui_windows_create[ui_id] = obj
		obj:loadAnsy(callback)
	end
end

-- 销毁窗口
function GameUIManager:destroy_window( ui_id )
	if _ui_windows_create[ui_id]==nil then
		cclog("没有初始化 DESTROY："..ui_id);
		return nil;
	end
	_ui_windows_create[ui_id]:destroy();
	_ui_windows_create[ui_id] = nil;

	if _ui_windows_loading[ui_id] then
		_ui_windows_loading[ui_id] = nil
	end

	if game_app and self:get_ui_show_num()==0 then
		game_app:SendGameNotify(GameConfig.NOTIFY_UI_OC_INFO,"show")
	end
	return true
end
--销毁不在显示的窗口
function GameUIManager:destroy_all_unshow_window()
	for k,v in pairs(_ui_windows_create) do
		if self:get_win_status(v.UI_ID) ~= "ONSHOW" then
			cclog("···DESTROY：",v.UI_ID)
			self:destroy_window(v.UI_ID)
		end
	end
end

-- 显示窗口
-- 可以直接调用，如果没创建，会自动创建
function GameUIManager:show_window( ui_id,data)
	local func = function()
		cclog("显示窗口:"..ui_id)
		local window = _ui_windows_create[ui_id];
		if window~=nil and window:getSTATE() == "ONLOAD" then
			cclog("没有初始化 SHOW："..ui_id);
			self:create_window( ui_id );
			_ui_windows_create[ui_id]:setshow(_ui_root,data);
			if _ui_windows_shown[ui_id] == nil then
				_ui_windows_shown[ui_id] = _ui_windows_create[ui_id]
			end
			_ui_windows_loading[ui_id] = nil
			if game_app then
				game_app:SendGameNotify(GameConfig.NOTIFY_UI_OC_INFO,"hide")
			end
			return
		end
		if _ui_windows_shown[ui_id] == nil then
			_ui_windows_shown[ui_id] = window
		else
			cclog("已经被显示窗口:"..ui_id)
			if _ui_windows_shown[ui_id].setUI then
				 _ui_windows_shown[ui_id]:setUI(data)
			end
			return --已经被显示
		end
		if window then
			window:setshow(_ui_root,data)
			if game_app then
				game_app:SendGameNotify(GameConfig.NOTIFY_UI_OC_INFO,"hide")
			end
		else
			cclog("没有这个窗口:",ui_id)
		end
	end

	if _ui_windows_loading[ui_id] then
		func()
	else
		self:load_windowRes(ui_id, func)
	end
end

-- 隐藏窗口
-- 只是取消渲染，不会删除窗口
function GameUIManager:hide_window( ui_id ,fun)
	local window = self:find_window(ui_id)
	if window ~= nil then
		window:onhide(fun);
		_ui_windows_shown[ui_id] = nil
		window = nil
		cclog("hide windown : %s  %s",ui_id,tostring(_ui_windows_shown[ui_id]))
		if game_app and self:get_ui_show_num()==0 then
			game_app:SendGameNotify(GameConfig.NOTIFY_UI_OC_INFO,"show")
		end
	end
end
-- 隐藏所有窗口
-- 只是取消渲染，不会删除窗口
function GameUIManager:hide_all_window()
	for _,v in pairs(_ui_windows_shown) do
		v:onhide();
		_ui_windows_shown[v.UI_ID] = nil
		v=nil
	end
end

--隐藏所有窗口,打开目标窗口
function GameUIManager:hide_other_open_target_window(ui_id, data)
	local isOpen = false
	for _,v in pairs(_ui_windows_shown) do
		if v.UI_ID == ui_id then
			if v.setUI then
				v:setUI(data)
			end
			isOpen = true
		else
			v:onhide()
			_ui_windows_shown[v.UI_ID] = nil
			v=nil
		end
	end
	if not isOpen then
		self:show_window(ui_id,data)
	end
end

-- 界面通知管理器刷新界面当前状态，由dlgbase统一调用
function GameUIManager:Update_windowState(ui_id,state)
	if state == "ONSHOW" then
		_ui_windows_shown[ui_id] = _ui_windows_shown[ui_id] or _ui_windows_create[ui_id]
	elseif state == "HIDE" then
		_ui_windows_shown[ui_id] = nil
	elseif state == "destroy" then
		_ui_windows_shown[ui_id] = nil
		_ui_windows_create[ui_id] = nil;
	end
end
-- 找到窗口
function GameUIManager:find_window( ui_id )
	if _ui_windows_create[ui_id] ~= nil then
		assert(_ui_windows_create[ui_id],string.format("Manager find_window error,ui_id = %d",ui_id))
		return _ui_windows_create[ui_id]
	end
end
-- 界面刷新
function GameUIManager:Updata_window( dt)
	for _,v in pairs(_ui_windows_shown) do
		v:Updata(dt)
	end
end

-- 检测某一窗口当前状态
function GameUIManager:get_win_status(ui_id)
	assert(_ui_create_table[ui_id],string.format("Manager get_win_status error,ui_id = %d",ui_id))
	assert(_ui_windows_create[ui_id],string.format("_ui_windows_create get_win_status error,ui_id = %d",ui_id))
	return _ui_windows_create[ui_id]:getSTATE();
end
--返回正在显示的窗口table
function GameUIManager:get_all_onshow()
	return _ui_windows_shown
end

--返回所有的定义界面
function GameUIManager:get_All_windwos()
    return _ui_create_table
end

--获取创建ui个数
function GameUIManager:get_ui_create_num()
	local _ui_create_num = 0
	for _,v in pairs(_ui_create_table) do
		_ui_create_num = _ui_create_num + 1
	end
	return _ui_create_num;
end
--获取显示ui个数
function GameUIManager:get_ui_show_num()
	local _ui_show_num = 0
	
	for _,v in pairs(_ui_windows_shown) do
		_ui_show_num = _ui_show_num + 1
	end
	return _ui_show_num;
end
----
function GameUIManager:OnKeyEven(keyCode, event)
	if keyCode == cc.KeyCode.KEY_BACK then
	elseif keyCode == cc.KeyCode.KEY_MENU  then
	end
end

function GameUIManager:destroy_all_show_window()
	for _,v in pairs(_ui_windows_shown) do
		if self:get_win_status(v.UI_ID) == "ONSHOW" then
			cclog("···DESTROY：",v.UI_ID)
			self:destroy_window(v.UI_ID)
		end
	end
end

function GameUIManager:clear_ui_layer_child( )
	_ui_root:removeAllChildren()
end
