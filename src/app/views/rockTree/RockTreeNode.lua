
--
--Author:lihengjin
--Date: 2020/4/13
--Function:摇钱树节点
--

local BaseTipsDialog = require "scripts/UI/component/BaseTipsDialog"
local RockTreeLiBaoTip = import(".RockTreeLiBaoTip")
require "scripts/cnf/yaoqianshu_yuanbao_config"
require "scripts/cnf/yaoqianshu_wushebi_config"
require "scripts/cnf/yaoqianshu_map_config"

local SHOW_ROCKTREE_TIPS = true

local RICH_DESC_CFG = {
	[1] = "<COLOR VALUE=FF00DC00>每摇一次将获得<COLOR VALUE=FFedbf00>%d</COLOR>元宝",
	--[2] = "<COLOR VALUE=FF00DC00>每摇一次将获得<COLOR VALUE=FFedbf00>%d</COLOR>无赦币",
}

local RockTreeRankCell = import(".RockTreeRankCell")
local UILayerbase = import("...base/UILayerbase")
local RockTreeNode = class("RockTreeNode", UILayerbase)

function RockTreeNode:ctor()
	self.super.ctor(self)
    self.name = "RockTreeNode"
    self.csbfile = "rockTree/RockTreeNode.csb"
    self.callback = handler(self, self.onTouchCallBack)
end

function RockTreeNode:create(_parent)
	self.super.create(self)
	self.parent = _parent
	self.game_layer = ccui.Helper:seekWidgetByName(self._widget,"game_layer")

	self.gold_rich = self.game_layer:getChildByName("gold_rich")

	self.goldRichText = ccui.RichText:create()
	self.goldRichText:ignoreContentAdaptWithSize(false)
	self.goldRichText:setAnchorPoint(0.5,0.5)
	self.goldRichText:setWrapMode(1)
	self.goldRichText:setHorizontalAlignment(1)
	self.goldRichText:setTouchEnabled(false)
	self.goldRichText:setContentSize(cc.size(300,22))
	self.goldRichText:setText("", nil, 20)
	self.gold_rich:addChild(self.goldRichText)

	self.btn_gold = self.game_layer:getChildByName("btn_gold")
	self.gold_free_node = self.game_layer:getChildByName("gold_free_node")
	self.gold_cost_node = self.game_layer:getChildByName("gold_cost_node")

	-- self.wushe_rich = self.game_layer:getChildByName("wushe_rich")

	-- self.wusheRichText = ccui.RichText:create()
	-- self.wusheRichText:ignoreContentAdaptWithSize(false)
	-- self.wusheRichText:setAnchorPoint(0.5,0.5)
	-- self.wusheRichText:setWrapMode(1)
	-- self.wusheRichText:setHorizontalAlignment(1)
	-- self.wusheRichText:setTouchEnabled(false)
	-- self.wusheRichText:setContentSize(cc.size(300,22))
	-- self.wusheRichText:setText("", nil, 20)
	-- self.wushe_rich:addChild(self.wusheRichText)

	-- self.btn_wushe = self.game_layer:getChildByName("btn_wushe")
	-- self.wushe_free_node = self.game_layer:getChildByName("wushe_free_node")
	-- self.wushe_cost_node = self.game_layer:getChildByName("wushe_cost_node")

	self.rank_scroll = self.game_layer:getChildByName("rank_scroll")
	self.rank_scroll:setScrollBarEnabled(false)

	self.todaytime = self.game_layer:getChildByName("todaytime")

	self.effect_layout = self.game_layer:getChildByName("effect_layout")
	self.effect_layout:setVisible(false)

	self.move_1 = self.effect_layout:getChildByName("move_1")
	self.move_2 = self.effect_layout:getChildByName("move_2")
	self.openLB = self.game_layer:getChildByName("openLB")
	self.red_img = self.game_layer:getChildByName("red_img")
	self.red_img:setVisible(false)

	local openday = PrivateStateManager:getInstance():GetRDays() or 1--开服天数
	local value = PrivateStateManager:getInstance():GetStateValue(2600)
	local isget = Utils:get_bit_by_position(value, 7)
	if openday >= 3 or isget == 1 then
		self.openLB:setVisible(true)
	else
		self.openLB:setVisible(false)
	end

	self:setLiBaoState()
	self:initEvent()
	self:updateContentUI()
	self:reqRankInfo()
	return self
end

function RockTreeNode:setLiBaoState()
	local p = PrivateStateManager:getInstance():GetStateValue(2600)
	local isget = Utils:get_bit_by_position(p, 7)
	if RockTreeRedMgr:getInstance().rockTreeGiftShow and isget == 0 then
		--self.red_img:setVisible(true)
		UIBuilder.onAddRedDot(self.openLB, true, 60, 60)
	end
end

function RockTreeNode:initEvent()
	self.updateInfo = function()
		self:updateContentUI()
	end
	game_app:BindGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+1779, self.updateInfo)
	-- game_app:BindGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+1778, self.updateInfo)
	game_app:BindGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+1777, self.updateInfo)
	-- game_app:BindGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+1776, self.updateInfo)

	self.onLiBaoBtn = function()
		local p = PrivateStateManager:getInstance():GetStateValue(2600)
		local isget = Utils:get_bit_by_position(p, 7)
		-- self.openLB:setGrey(true)
		--self.red_img:setVisible(false)
		UIBuilder.onAddRedDot(self.openLB, false, 60, 60)
	end
	game_app:BindGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+2600, self.onLiBaoBtn)

end

function RockTreeNode:reqRankInfo()
	local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_Rankings)
    protocal.Rankings_page = 28
    ProtocalPool.SendCMD(NET_ID, protocal)
end

function RockTreeNode:updateContentUI()
	self.gold_free_times = PrivateStateManager:getInstance():GetStateValue(1779) --元宝免费次数
	-- self.wushe_free_times = PrivateStateManager:getInstance():GetStateValue(1776) --无赦免费次数
	self.gold_use_times = PrivateStateManager:getInstance():GetStateValue(1777) --元宝摇钱次数
	-- self.wushe_use_times = PrivateStateManager:getInstance():GetStateValue(1778) --无赦摇钱次数

	if self.gold_use_times == #yaoqianshu_yuanbao_config then
		self.gold_rich:setVisible(false)
		self.btn_gold:setBright(false)
		self.btn_gold:setTouchEnabled(false)
		self.btn_gold:getChildByName("btn_txt"):setString("次数已摇完")
		self.gold_free_node:setVisible(false)
		self.gold_cost_node:setVisible(false)
	else
		self.gold_rich:setVisible(true)
		self.btn_gold:setBright(true)
		self.btn_gold:setTouchEnabled(true)
		self.btn_gold:getChildByName("btn_txt"):setString("摇1次")
		self.gold_free_node:setVisible(false)
		self.gold_cost_node:setVisible(false)

		self.next_gold_cfg = yaoqianshu_yuanbao_config[self.gold_use_times + 1]

		self.goldRichText:setText(string.format(RICH_DESC_CFG[1], self.next_gold_cfg.gold))

		if self.gold_free_times < 1 then
			self.gold_free_node:setVisible(true)
			self.gold_free_node:getChildByName("gold_free_times"):setString( (1 - self.gold_free_times) .. "/1")
		else
			self.gold_cost_node:setVisible(true)
			self.gold_cost_node:getChildByName("gold_cost"):setString(self.next_gold_cfg.key)
		end
	end

	-- if self.wushe_use_times == #yaoqianshu_wushebi_config then
	-- 	self.wushe_rich:setVisible(false)
	-- 	self.btn_wushe:setBright(false)
	-- 	self.btn_wushe:setTouchEnabled(false)
	-- 	self.btn_wushe:getChildByName("btn_txt"):setString("次数已摇完")
	-- 	self.wushe_free_node:setVisible(false)
	-- 	self.wushe_cost_node:setVisible(false)
	-- else
	-- 	self.wushe_rich:setVisible(true)
	-- 	self.btn_wushe:setBright(true)
	-- 	self.btn_wushe:setTouchEnabled(true)
	-- 	self.btn_wushe:getChildByName("btn_txt"):setString("摇1次")
	-- 	self.wushe_free_node:setVisible(false)
	-- 	self.wushe_cost_node:setVisible(false)

	-- 	self.next_wushe_cfg = yaoqianshu_wushebi_config[self.wushe_use_times + 1]

	-- 	self.wusheRichText:setText(string.format(RICH_DESC_CFG[2], self.next_wushe_cfg.gold))

	-- 	if self.wushe_free_times < 3 then
	-- 		self.wushe_free_node:setVisible(true)
	-- 		self.wushe_free_node:getChildByName("wushe_free_times"):setString( (3 -self.wushe_free_times) .. "/3")
	-- 	else
	-- 		self.wushe_cost_node:setVisible(true)
	-- 		self.wushe_cost_node:getChildByName("wushe_cost"):setString(self.next_wushe_cfg.key)
	-- 	end
	-- end

	self.todaytime:setString(string.format("今日已摇: %d次", self.gold_use_times))-- + self.wushe_use_times
end

function RockTreeNode:updateRankInfo()
	self.rank_scroll:removeAllChildren()
	if table.nums(self.rankData.Rankings_Info) > 0 then
		local height = table.nums(self.rankData.Rankings_Info) * 49 >= 194 and table.nums(self.rankData.Rankings_Info) * 49 or 194
		self.rank_scroll:setInnerContainerSize(cc.size(395,height))
		for i=1, #self.rankData.Rankings_Info do
			local node = RockTreeRankCell.new(self)
			node:setPosition(cc.p(0, height - i* 49))
			node:updateContent(self.rankData.Rankings_Info[i])
			self.rank_scroll:addChild(node)
		end
	end
end

function RockTreeNode:showEffect(data)
	self.effect_layout:setScale(1.0)
	self.effect_layout:setVisible(true)
	self.effect_layout:setPosition(cc.p(318, 286))
	self.effect_layout:getChildByName("bei_img"):loadTexture("baoji_" .. data.beilv .. ".png", 1)
	self.effect_layout:getChildByName("baoji_num"):setString("+"..data.total)
	
	local x = data.id == 1 and self.move_1:getPositionX() or self.move_2:getPositionX()
	local y = data.id == 2 and self.move_2:getPositionY() or self.move_2:getPositionY()

	local action1 = cc.ScaleTo:create(0.3, 1.5)
	local action2 = cc.ScaleTo:create(0.3, 0.2)

	local sequence_1 = cc.Sequence:create(action1, action2)

	local moveBy = cc.MoveBy:create(0.8, cc.p(x, y))

	local action = cc.Spawn:create(sequence_1, moveBy)

	local function callOver(sender)
		self.effect_layout:setVisible(false)	
	end
	local sequence = cc.Sequence:create(action,  cc.CallFunc:create(callOver) )
	self.effect_layout:stopAllActions()
	self.effect_layout:runAction(sequence)
end

function RockTreeNode:reqRockTree(id)
	if id == 1 and self.gold_use_times < 1 then
		local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_ROCK_TREE)
	    protocal.id = id
	    ProtocalPool.SendCMD(NET_ID, protocal)

	-- elseif id ==2 and self.wushe_free_times < 3 then
	-- 	local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_ROCK_TREE)
	--     protocal.id = id
	--     ProtocalPool.SendCMD(NET_ID, protocal)
	elseif SHOW_ROCKTREE_TIPS == false then
		local data =  self.next_gold_cfg
		local openday = PrivateStateManager:getInstance():GetRDays() or 1
		local cost_type = openday <= 7 and 2 or 8
		if GSetPopGold(data.key, cost_type) then
			local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_ROCK_TREE)
		    protocal.id = id
		    ProtocalPool.SendCMD(NET_ID, protocal)
		end
	else
		local data =  self.next_gold_cfg --or self.next_wushe_cfg--id == 1 and

		local openday = PrivateStateManager:getInstance():GetRDays() or 1
		local cost_type = openday <= 7 and 2 or 8

		local function cancelButtonCallBack()
								----
		end

		local  function okButtonCallback()
			if GSetPopGold(data.key, cost_type) then
				local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_ROCK_TREE)
			    protocal.id = id
			    ProtocalPool.SendCMD(NET_ID, protocal)
			end
		end

		local function checkBoxCallback(eventType)
			if eventType == 1 then
				SHOW_ROCKTREE_TIPS = true
			elseif eventType == 0 then
				SHOW_ROCKTREE_TIPS = false
			end
		end

		local tipsContent = ""

		if openday <= 7 then
			tipsContent = "<COLOR VALUE=FFaea66f>本次摇树需要消耗<COLOR VALUE=FFFFF2B7>".. data.key.. "</COLOR>充钻"
		else
			tipsContent = "<COLOR VALUE=FFaea66f>本次摇树需要消耗<COLOR VALUE=FFFFF2B7>".. data.key.. "</COLOR>混钻"
		end


		local data1 = {
			tips = "提   示",
			tipsColor = cc.c3b(255, 242, 183),
			content = tipsContent,
			isRich = true,
			richDirection = 1,
			leftBtnText = "取消",
			leftBtnCallBack = cancelButtonCallBack,
			rightBtnText = "确定",
			rightBtnCallBack = okButtonCallback,
			checkBoxCallBack = checkBoxCallback,
		}

	    local tips = BaseTipsDialog.new(data1)
	    tips:setPosition(SCREEN_SIZE.width / 2, SCREEN_SIZE.height / 2)
	    GameWorld.Layer:get_layer_info():addChild(tips)
	end
end

--网络监听(服务器推送消息)
function RockTreeNode:ListenNetWorkMsg(msg_type, msg_data)
	if msg_type == ProtocalCode.PT_Rankings then
		self.rankData = msg_data
		self:updateRankInfo()
	elseif msg_type == ProtocalCode.PT_ROCK_TREE then
		self:showEffect(msg_data)
	end
end

function RockTreeNode:onTouchCallBack(sender)
	local name = sender:getName()
	if name == "btn_gold" then
	   self:reqRockTree(1)
		
	-- elseif name == "btn_wushe" then
	-- 	-- local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_ROCK_TREE)
	--  --    protocal.id = 2
	--  --    ProtocalPool.SendCMD(NET_ID, protocal)
	--     self:reqRockTree(2)
	elseif string.sub(name, 1, 7) == "btn_go_" then
		local index = tonumber(string.sub(name, -1))
		local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_ROCK_TREE)
	    protocal.id = 3
	    protocal.map_id = yaoqianshu_map_config[index].index
	    ProtocalPool.SendCMD(NET_ID, protocal)
	elseif  name == "openLB" then
		local p = PrivateStateManager:getInstance():GetStateValue(2600)
		local isget = Utils:get_bit_by_position(p, 7)
		if isget == 0 then
			GameUIManager:show_window(GameConfig.UI_ROCK_TREE_LB_PANEL)
			GameUIManager:destroy_window( GameConfig.UI_ROCK_TREE )
		else
			local tips = RockTreeLiBaoTip.new()
			tips:setPosition(tips:getPositionX()+80+330/2,tips:getPositionY()+50)
			tips.black:setPosition(tips.black:getPositionX()-(80+330/2),tips.black:getPositionY()-50)
			self.parent:addChild(tips)
		end
	end
end

function RockTreeNode:destroy()
	game_app:CancelGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+1779, self.updateInfo)
	-- game_app:CancelGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+1778, self.updateInfo)
	game_app:CancelGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+1777, self.updateInfo)
	-- game_app:CancelGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+1776, self.updateInfo)
	game_app:CancelGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+2600, self.onLiBaoBtn)
	self.super.destroy(self)
end

return RockTreeNode