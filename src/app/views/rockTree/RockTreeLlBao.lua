--
--Author:yinhuawang
--Date: 2020/12
--Function:摇钱树礼包
--
local Dlgbase = import("...base/Dlgbase")
local RockTreeLiBao = class("RockTreeLiBao", Dlgbase)
require "scripts/cnf/zuanshihuishou_LiBao_config"
local zuanshihuishou_LiBao_config = zuanshihuishou_LiBao_config

local Timer = require "scripts/utils/timer"

function RockTreeLiBao:ctor()
    self.super.ctor(self)

    self.UI_ID = GameConfig.UI_ROCK_TREE_LB_PANEL
    self.name = "UI_ROCK_TREE_LB_PANEL"
    self.csbfile = "rockTree/RockTreeLlBao.csb"
    self.res_list = {
        "rockTree/rockTree.png",
    }
    self.classDestroy = true
    self.item = 0
    self.id = 1
    self.isShow = false
end

function RockTreeLiBao:create()
    self.super.create(self)
    self.panel = self:seekNode("panel")
    self.black = self:seekNode("black")
    self.black:setContentSize(SCREEN_SIZE)
    self.close_btn = UIBuilder.createByWidget(self:seekNode("close_btn"))
    self.buyBtn = UIBuilder.createByWidget(self:seekNode("buyBtn"))

    self.waitLayer = self:seekNode("wait_layer")
    self.title_img = self:seekNode("title_img")
    self.Image_2 = self:seekNode("Image_2")

    self.item_layer   = UIBuilder.createByWidget(self:seekNode("item_layer"))
    self.sycs_lab_2_0 = self:seekNode("sycs_lab_2_0")

    self.Panel_1 = self:seekNode("Panel_1")
    self.diamond = self.Panel_1:getChildByName("diamond")
    self.diamond_btn = self.Panel_1:getChildByName("diamond_btn")
    self.wushebi = self.Panel_1:getChildByName("wushebi")
    self.wushebi_btn = self.Panel_1:getChildByName("wushebi_btn")
    self.gold = self.Panel_1:getChildByName("gold")
    self.gold_btn = self.Panel_1:getChildByName("gold_btn")
    self.bind_gold = self.Panel_1:getChildByName("bind_gold")
    self.bind_gold_btn = self.Panel_1:getChildByName("bind_gold_btn")
    self.bind_gold_img = self.Panel_1:getChildByName("bind_gold_img")
    self.bind_gold_img:loadTexture("ico_yb02.png",1)
    self.index = 1
    local isopen = MainLayerManager:getInstance().server_channelId  --服务器渠道id
    self.charge_bili = 500
    if isopen == 193 then
        self.charge_bili = 200
    end
    self.config = zuanshihuishou_LiBao_config[8] -- 摇钱树礼包
    self:bindEvent()
    self:_initRewardItem()
    self:showPlayerInfo()
    return self
end

function RockTreeLiBao:bindEvent( ... )
	local function _close()
        RockTreeRedMgr:getInstance().rockTreeGiftShow = false
        RockTreeRedMgr:getInstance():updateRed()
        GameUIManager:destroy_window(self.UI_ID)
    end
    self.black:addClickEventListener(_close)
    self.close_btn:addClickEventListener(_close)

    self.buyBtn:addClickEventListener(function( ... )
        PayManager:getInstance():pay(8, self.config.key,"gift" .. 125)
        self:showWaitLayer()
        -- GameUIManager:destroy_window(self.UI_ID)
    end)

    self.onGoldUpdate = function()
        self:showPlayerInfo()
    end
    game_app:BindGameNotify(GameConfig.NOTIFY_GOLD_INFO, self.onGoldUpdate)   --货币刷新

    local btnCallback = function(sender)
        local name = sender:getName()
        if name == "diamond_btn" or name == "wushebi_btn" then
            local num_2=PrivateStateManager:getInstance():GetStateValue(312)
            if num_2>0 then--大于0就跑去充值界面
                GameUIManager:show_window(GameConfig.UI_VIP_PANEL, {page = 4})
            else  --首充界面
                GameUIManager:show_window(GameConfig.UI_SHOUCHONG_PANEL)
            end
        elseif name == "gold_btn" then
            UIBuilder.createQuickBuy(7, "购买元宝")
        elseif name == "bind_gold_btn" then
            local award = PrivateStateManager.getInstance():GetStateValue(1786)
            if GGetPlayerAttr("level") >= config_functionBtnArray[118].level and award and award == 0 then
                GameUIManager:show_window(GameConfig.UI_XYHL_PANEL)
            elseif GGetPlayerAttr("level") >= config_functionBtnArray[119].level and award and award == 1 then
                GameUIManager:show_window(GameConfig.UI_WLMB_PANEL)
            else
                GShowTipsMsg("等级未达到"..config_functionBtnArray[118].level)
            end
        end
    end
    self.diamond_btn:addClickEventListener(btnCallback)
    self.wushebi_btn:addClickEventListener(btnCallback)
    self.gold_btn:addClickEventListener(btnCallback)
    self.bind_gold_btn:addClickEventListener(btnCallback)
end

function RockTreeLiBao:showWaitLayer()
    self:closeTimer()
    local p = PrivateStateManager:getInstance():GetStateValue(2600)
    local isget = Utils:get_bit_by_position(p, 7)
    if isget == 1 then
        self.buyBtn:setEnabled(false)
        return
    end
    local timerCnt = 0

    local function tick()
        timerCnt = timerCnt + 1

        if timerCnt >= 3 then
            self:closeTimer()
            self.waitLayer:setVisible(false)
            GameUIManager:destroy_window(self.UI_ID)
        end
    end
    
    self.timer = Timer()

    self.timer:start(1, tick)
    self.waitLayer:setVisible(true)
end

function RockTreeLiBao:_initRewardItem()

    self.itemsPage = ItemsPage:create(nil,-50,2,1,#self.config.award,15,0, nil, false, nil, nil, nil, false, true, true)
    self.item_layer:addChild(self.itemsPage)
    self.itemsPage:updateCellByList(self.config.award)
    for i=1,#self.config.award do 
        local item = self.itemsPage:getItemCellByIndex(i)
        item:clearImgQuality()
        item:showCellCircleEffect(self.config.award[i].effect)
        item:showItemSname(true)
    end
    self.sycs_lab_2_0:setString( self.config.key.."元" )
end

function RockTreeLiBao:showPlayerInfo()
    self.diamond:setString(GGetPlayerAttr("charge_diamond"))
    self.wushebi:setString(GGetPlayerAttr("bind_diamond"))
    self.gold:setString(GGetPlayerAttr("gold") + GGetPlayerAttr("bind_gold"))
    self.bind_gold:setString(PrivateStateManager:getInstance():GetStateValue(1789) or 0)
end

function RockTreeLiBao:closeTimer()
    if self.timer then
        self.timer:stop()
        self.timer = nil
    end
end

function RockTreeLiBao:showFinishCall()

end

function RockTreeLiBao:show(root)
    self.super.show(self,root)
    local cb_fun = function( ... )
        self:showFinishCall()
    end

    self.panel:setScale(0)
    local seq1 = cc.Sequence:create(cc.EaseBackOut:create(cc.ScaleTo:create(0.2, 1)),cc.CallFunc:create(cb_fun))
    self.panel:runAction(seq1);
end

function RockTreeLiBao:destroy()
    self:closeTimer()
    game_app:CancelGameNotify(GameConfig.NOTIFY_GOLD_INFO, self.onGoldUpdate)   --货币刷新
    self.super.destroy(self)
end

return RockTreeLiBao