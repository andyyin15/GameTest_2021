
--
--Author:lihengjin
--Date: 2020/4/13
--Function:摇钱树面板
--


local RockTreeNode = import(".RockTreeNode")
local DlgBaseWindow = import("...base/DlgBaseWindow")
local RockTreePanel = class("RockTreePanel", DlgBaseWindow) 

function RockTreePanel:ctor()
	self.super.ctor(self)
	self.classDestroy=true
	self.UI_ID = GameConfig.UI_ROCK_TREE
	self.name = "RockTreePanel"
	self.sprits_path = {
	}

	self.view={}   --视图列表
end

function RockTreePanel:create()
	self.super.create(self)
	self:setTitleString("摇钱树")--窗口标题
	self:openClickWindowOutClose()--开启点击窗口以外部分关闭界面
	self:setBlackOpacity(0)--窗口以外的黑色部分半透明值
	self:bindEvent()

	return self
end

function RockTreePanel:bindEvent()
	-- body
end

function RockTreePanel:showFinishCall()
	self.view[#self.view + 1] = RockTreeNode:new():create(self)
	self.view[#self.view]:show(self.context)
end

--网络监听(服务器推送消息)
function RockTreePanel:ListenNetWorkMsg(msg_type, msg_data)

	self.super.ListenNetWorkMsg(self, msg_type, msg_data)
	--子页面监听网络
	for i, v in ipairs(self.view) do
		v:ListenNetWorkMsg(msg_type, msg_data)
	end
end

--关闭界面回调
function RockTreePanel:closeCallBack()
	
end

function RockTreePanel:destroy()
	for key, value in pairs(self.view) do
		if value["destroy"] then
			value:destroy()
		end
	end
	self.super.destroy(self)
end

return RockTreePanel