---------窗口基类
---------2013.9.26 by ping
--cocos3.0beta 修改 by ping
--2015.2.11 修改 by ping
----------------------------------------------------------------------
----------------------------------------------------------------------
---------
---------Dlgbase类

local Dlgbase = class("Dlgbase",cc.LayerColor)--super_class.Dlgbase()
-- local Dlgbase = class("Dlgbase",cc.Node)
local STATE_INIT = "INIT"
local STATE_ONLOAD = "ONLOAD"
local STATE_CREATE = "CREATE"
local STATE_ONSHOW = "ONSHOW"
local STATE_HIDE = "HIDE"
local STATE_destroy = "destroy"
function Dlgbase:ctor()--__init( )
	-- Dlgbase.super.ctor(self)
	self.isShowing = false;--是否已经显示在界面
	self.data = nil;
	self.name = "Dlgbase"
	self.UI_ID = 0;
	self.STATE = STATE_INIT;
	self.csbfile = ""
	self.src_path = "UI/"
	self.callback = nil
	self.enableBack = false;
	self.Color = cc.c4b(0,0,0,255)
	self.z = 50
	self.res_list = {}--资源列表

	self:retain()
	self:enableNodeEvents()
	self.notify_funcs = {}
end
--加载异步加载资源
function Dlgbase:loadAnsy(func)
	self.STATE = STATE_ONLOAD;
	local res_size = #self.res_list
	if res_size == 0 then
		func()
		return
	end
	for i,v in ipairs(self.res_list) do
		local imageLoaded = function()
			res_size = res_size - 1
			if res_size == 0 then
				func()
			end
		end
		cc.Director:getInstance():getTextureCache():addImageAsync("UI/"..v, imageLoaded)
	end
end
--创建界面（加载资源但是不渲染，会申请内存）
function Dlgbase:create()
	-- Dlgbase.super.create(self)
	print("创建界面Dlgbase:%s",self.csbfile)
	self.STATE = STATE_CREATE;
	-- local view = cc.LayerColor:create(self.Color);
	--界面进出渲染时触发
	-- view:registerScriptHandler(
	-- 	function ( tag )
	-- 		self:OnEnterOrExit( tag )
	-- 	end
	-- 	)
	-- local PixelFormat = self.PixelFormat or cc.TEXTURE2_D_PIXEL_FORMAT_AUTO;
	-- cc.Texture2D:setDefaultAlphaPixelFormat(PixelFormat)
	local _widget
	_widget = cc.CSLoader:createNode(self.src_path..self.csbfile)
	tolua.cast(_widget,"ccui.Widget")
	_widget:setAnchorPoint(cc.p(0.5, 0.5))

	self:addChildTouchCallback(_widget)

	-- _widget:setPosition(SCREEN_SIZE.width/2, SCREEN_SIZE.height/2)
	-- cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_AUTO)
	self.Attribute = {}
	self._widget = _widget
	if self._widget then
		self:addChild(self._widget)
	end
	-- self:retain();
	_widget = nil;
	return self
end

function Dlgbase:addChildTouchCallback(_node)

	if self.callback == nil then return end

	if _node == nil then
        return false
    end

    local children = _node:getChildren()
    for i=1, #children do
        local child = children[i]
        local name = child:getName()
        -- print("child:", name, child:getDescription())
        if self.callback then
            self:registClickCallBack(child, self.callback)
        end

        self:addChildTouchCallback(child)
    end
end


-- 注册按钮点击时间(CCUI)
-- @param _btn(CCNode) 节点
-- @param _handler(function) 触摸回调地址
-- @param _isNeedScale(bool) 是否需要缩放
function Dlgbase:registClickCallBack( _btn, _handler, _isNeedScale )
    if _btn == nil or _handler == nil then
        print("get nil btn or handler when registClickCallBack")
        return 
    end
    local isNeedScale = _isNeedScale or false
    if _btn.addTouchEventListener == nil then
        print("btn is not click type ui !")
        return 
    end
    _btn:addTouchEventListener(function ( sender, eventType )
        if sender then
            if eventType == ccui.TouchEventType.began then 
                
            elseif eventType == ccui.TouchEventType.canceled then
 
            elseif eventType == ccui.TouchEventType.ended then

                _handler(sender)
            end
        end
    end)
end

-- function Dlgbase:setPosition(x, y)
-- 	if self ~= nil then
-- 		self:setPosition(x, y)
-- 	end
-- end
---------
---------
-- function Dlgbase:getPosition()
-- 	if self ~= nil then
-- 		return self:getPositionS()
-- 	end
-- end
---------
---------设置锚点
-- function Dlgbase:setAnchorPoint(pos)
-- 	if self ~= nil then
-- 		self:setAnchorPoint(pos)
-- 	end
-- end
--------添加界面--只添加不在窗口显示
function Dlgbase:onshow( root )
	if self ~= nil then
		root:addChild(self);
	end
end
function Dlgbase:onEnter()
	print("Dlgbase:OnEnter()")
end
function Dlgbase:onExit()
	
end
------进入场景和退出场景回调函数
-- function Dlgbase:OnEnterOrExit( tag )
-- 	-- print("uiname:",self.name,tag)
-- 	-- if tag == "enter" then
-- 	-- elseif tag == "exit" then
-- 	-- end
-- end
-------查找界面csb的对象
function Dlgbase:seekNode(n,parent)
    assert(type(n)=="string" or type(n)=="number" , string.format("错误的查询%sUI %stag",self.name,n))
    local node=nil
    local prent=parent or self._widget
    if type(n)=="string" then
        node=ccui.Helper:seekWidgetByName(prent,n)
    else
        node=ccui.Helper:seekWidgetByTag(prent,n)
    end
    if node == nil then
    	print("界面"..self.name.."查询不到："..n)
    end
	prent = nil;
	return node
end
--------打开界面
function Dlgbase:show( parent_view ,...)
	if parent_view == nil then print("show -> parent_view is nil "); return end
	if self ~= nil and self.isShowing==false then
		print("Dlgbase:show:%s",tostring(self.UI_ID))
		if parent_view:getChildByTag(self.UI_ID) then
			self:setVisible(true)
		else
			parent_view:addChild(self,self.z,self.UI_ID);
			self:setVisible(true)
		end
		self:setPosition(SCREEN_SIZE.width / 2,SCREEN_SIZE.height/2);
		self.isShowing = true;
		self.STATE = STATE_ONSHOW;
		GameUIManager:Update_windowState(self.UI_ID,self.STATE)
		if self.show_action ~= nil then
			self.show_action:retain()
			if self.show_action:isPlaying() then self.show_action:stop() end
			self.show_action:play()
			self._widget:setAnchorPoint(cc.p(0, 0))
		end
	end
end

function Dlgbase:setshow( parent_view, _data)
	if parent_view == nil then print("setshow -> parent_view is nil "); return end
	self.data = _data
	self:show(parent_view);
end

function Dlgbase:getdata()
	return self.data
end

function Dlgbase:getSelecPageIndex( )
    return 1
end

--界面刷新
function Dlgbase:Updata(dt)

end
---监听网络消息
function Dlgbase:ListenNetWorkMsg(msg_type, msg_data)
end

--------关闭界面
function Dlgbase:onhide( fun )
	local func = function()
		if self ~= nil then
			self:setVisible(false)
			self.isShowing = false;
			if fun ~= nil then
				fun()
				fun = nil
			end
			self.STATE = STATE_HIDE;
			GameUIManager:Update_windowState(self.UI_ID,self.STATE)
		end
	end
	if self.hide_action ~= nil then
		if self.hide_action:isPlaying() then self.hide_action:stop() end
		self.hide_action:retain()
		self.hide_action:play(cc.CallFunc:create(func))
	else
		func()
	end
end
--------销毁界面
function Dlgbase:destroy()
	if self.classDestroy and DEBUG > 1 then
		package.loaded[_ui_create_table[self.UI_ID]]=nil
		if self.sprits_path then
	    	local sprits_path = self.sprits_path
	    	if type(sprits_path) == "table" then
	    		for i,v in ipairs(sprits_path) do
		    		package.loaded[v] = nil
					require (v)
			    end
	    	else
	            package.loaded[_ui_create_table] = nil
	            require (sprits_path)
	    	end
	    end
	end

	--取消GameNotify的方法
	for k,v in pairs(self.notify_funcs) do
		game_app:CancelGameNotify(k,v)
	end

	if self._widget ~= nil then
		self._widget:removeAllChildren()
		self._widget:removeFromParent(true);
		self._widget = nil
		ccs.GUIReader:destroyInstance();
		cc.CSLoader:destroyInstance()
	end
	self.STATE = STATE_destroy;
	GameUIManager:Update_windowState(self.UI_ID,self.STATE)
	self:removeAllChildren()
	self:removeFromParent(true)
	self.isShowing = false;
	self.data = nil;
	print(collectgarbage("count"))
	for i,v in ipairs(self.res_list) do
		local prefix, suffix = self:getPrefixAndSuffix(self.src_path..v)
		print("清除图集或png:  "  .. prefix .. "." ..  suffix)
		if suffix == "plist" then
			cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile(self.src_path..v)
		else
			cc.Director:getInstance():getTextureCache():removeTextureForKey(self.src_path..v)
		end
	end
	self:release();
	print(collectgarbage("collect"))
	print(collectgarbage("count"))


end

function Dlgbase:getPrefixAndSuffix( __fileName )
    local prefix = ""
    local suffix = ""
    -- 前缀
    local idx = __fileName:match(".+()%.%w+$")
    if(idx) then
        prefix = __fileName:sub(1, idx-1)
    else
        prefix = __fileName
    end
    -- 扩展名
    suffix = __fileName:match(".+%.(%w+)$")

    return prefix, suffix
end

function Dlgbase:getSTATE(  )
	return self.STATE;
end
------界面是否被显示在界面上
function Dlgbase:isBeShowing( )
	return self.isShowing;
end
---响应手机返回按钮事件
function Dlgbase:keyPadEven( even )
	if self.enableBack and self.STATE == STATE_ONSHOW then
		Server:send(self.UI_ID.."_keyback",self.UI_ID)
	end
end

function Dlgbase:SendCMD(msg_type,tables)
	local protocal = ProtocalPool.GetCSPrototype(msg_type)
	if tables and type(tables) == "table" then
		for k,v in pairs(tables) do
			protocal[k] = v
		end
	end
	ProtocalPool.SendCMD(NET_ID, protocal)
end

function Dlgbase:loadData()

end

--绑定GameNotify的方法
function Dlgbase:BindGameNotify(notify_id, notify_func)
	if self.notify_funcs[notify_id] then
		return
	end
	game_app:BindGameNotify(notify_id,notify_func)
	self.notify_funcs[notify_id] = notify_func
end

return Dlgbase

