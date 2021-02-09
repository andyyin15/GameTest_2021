--
--Author:殷华旺
--Date:2020年7月24日
local Dlgbase = import("....packages.mvc.Dlgbase")
local ShouChongAward = class("ShouChongAward", Dlgbase)
require "app/cnf/newfirst_recharge_config"
-- local RoleModelPanel = require("scripts/UI/Dlg/role/RoleModelAction")
--local Cnfshouchong = GameConfig.Cnfshouchong
local recharge = newfirst_recharge_config

function ShouChongAward:ctor()
    self.super.ctor(self)

    -- self.UI_ID = GameConfig.UI_SHOUCHONG_PANEL--UI_SHOU_CHONG_PANEL
    self.name = "ShouChongAward"
    self.csbfile = "shouchong/shouchong.csb"
    self.classDestroy = true

    self.sprits_path = {"src/app/views/ShouChongAward/ShouChongAward"}
    self.res_list = 
    {
        "shouchong/shouchong.png"
    }
    self.dayBtn = {} --放开服前三天的按钮
    self.tag = nil
    self.showAction = true
end

function ShouChongAward:create()
    self.super.create(self)

    self.black = self:seekNode("black")
    self.black:setContentSize(SCREEN_SIZE)
    self.shouchong_layout = self:seekNode("shouchong_layout")
    self.red_bg = self.shouchong_layout:getChildByName("red_bg")
    self.red_bg:setSwallowTouches(true)
    self.biggest_text = self.shouchong_layout:getChildByName("biggest_text")
    self.text_down = self.shouchong_layout:getChildByName("text_down")
    self.first_day_btn = self.shouchong_layout:getChildByName("first_day_btn")
    self.first_day_btn:setTag(1)
    self.second_day_btn = self.shouchong_layout:getChildByName("second_day_btn")
    self.second_day_btn:setTag(2)
    self.third_day_btn = self.shouchong_layout:getChildByName("third_day_btn")
    self.third_day_btn:setTag(3)
    self.close_btn = self.shouchong_layout:getChildByName("btn_close")
    self.chognzhi_btn = self.shouchong_layout:getChildByName("chognzhi_btn")
    self.chognzhi_btn:setTitleText("")
   
    self.dayBtn = {self.first_day_btn,self.second_day_btn,self.third_day_btn}

    self.first_day_btn:addClickEventListener(handler(self, self.tabBtnCallBack))
    self.second_day_btn:addClickEventListener(handler(self, self.tabBtnCallBack))
    self.third_day_btn:addClickEventListener(handler(self, self.tabBtnCallBack))
    -- self:BindMsgHandle()
    -- self.get = game_app.privateManager:GetStateValue(311)
    -- for i=1,3 do
    --     local get = Utils:get_bit_by_position(self.get ,i )
    --     if get == 1 and i == 3 then
    --         self:tabClick(self.dayBtn[1])
    --     elseif get == 0 then
    --         self.tag = i
    --         break   
    --     end
    -- end
    local function _close()
        GameUIManager:destroy_window(self.UI_ID)
        GameSoundManager.GetInstance():PlaySystemEffectBy(SystemSounds.SID_CLOSE_UI)
    end
    self.close_btn:addClickEventListener(_close)
    self.black:addClickEventListener(_close)
    return self
end

function ShouChongAward:BindMsgHandle()
    self.OnPrivate311 = function()
       self.chognzhi_btn:setEnabled(false)
    end
    -- game_app:BindGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+311, self.OnPrivate311)
    game_app:BindGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+281, self.OnPrivate311)
end

function ShouChongAward:setPlayerMode()
    self.effectOn = true 
    self.effect1 = UIBuilder.CreateEffect(42001, 420, 90, self.shouchong_layout)
    self.effect2 = UIBuilder.CreateEffect(42001, -200, 95, self.shouchong_layout)

    local sex = GGetPlayerAttr("sex")
    self.effect3 = UIBuilder.createClothesEffect(GameConfig.Res_index[sex].Role_index+21103, 430, 100, self.shouchong_layout,nil,nil,nil,sex,nil)                                                    
    self.effect4 = UIBuilder.createWeaponEffect(GameConfig.Res_index[sex].Weapon_index+32001,-200+232, 100-2,self.shouchong_layout, 1/6, true, false)
    self.effect4:get_real_sprite():setRotation(-10)
    self.effect4:get_real_sprite():setScale(0.8)
    self.effect4:setPosition(-75,-30)
end

function ShouChongAward:tabClick(sender)
    if self.lastSender then
        self.lastSender:setBright(true)
        self.lastSender:setTitleColor(cc.c3b(83,42,14))
        self.lastSender:setEnabled(true)
    end
    self.lastSender = sender

    sender:setBright(false)
    sender:setTitleColor(cc.c3b(132,19,3))
    sender:setEnabled(false)
    self:tabShow(sender:getTag())
    self.tag = sender:getTag()
end

function ShouChongAward:tabShow(index)
    -- print("indexindex>>>>>>>>>>>>"..index)
    self.money = PrivateStateManager:getInstance():GetStateValue(312)
    self.isget = PrivateStateManager:getInstance():GetStateValue(281)
    local list = {}
    list = recharge[index].reward_list1
    if self.chongzhiAward then
        self.chongzhiAward:updateCellByList(list)
    else
        self.chongzhiAward = ItemsPage:create(list,-180,-50,1,#list,5,5,nil,false,nil,false,false,false,true,true)
        self:addChild(self.chongzhiAward)
    end

    local function _charge()
        if self.money == 0 then
            GameUIManager:show_window(GameConfig.UI_VIP_PANEL,{page = 3})
            GameUIManager:destroy_window(self.UI_ID)
        else
            local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_GET_SHOUCHONGJIANGLI)  -- 获得首充奖励 20068
            protocal.index = self.tag
            ProtocalPool.SendCMD(NET_ID, protocal)
        end
        
    end
    self.chognzhi_btn:addClickEventListener(_charge)
    self.chognzhi_btn:setEnabled(false)
    self.get = game_app.privateManager:GetStateValue(311)
    local get = Utils:get_bit_by_position(self.get ,index )
    if self.money == 0 then
        self.chognzhi_btn:setTitleText("充点小钱")
        self.chognzhi_btn:setEnabled(true)
        local btnSize = self.chognzhi_btn:getContentSize()
        if not self.effect5 then
            self.effect5 = UIBuilder.CreateEffect(1402, btnSize.width/2, btnSize.height/2+2, self.chognzhi_btn)
        end
    else
        self.chognzhi_btn:setTitleText("领取奖励")
        if self.isget==1 then
            -- break
        else
            if get == 0 then
                self.chognzhi_btn:setEnabled(true)
                if index > 1 then
                    if  Utils:get_bit_by_position(self.get ,index-1 ) == 0 then
                        self.chognzhi_btn:setEnabled(false)
                    end
                end
            else
                self.chognzhi_btn:setEnabled(false)
            end
        end
    end 
    if not self.effectOn then
        -- self:setPlayerMode()
    end
end

function ShouChongAward:tabBtnCallBack(sender)
    self:tabClick(sender)
end

function ShouChongAward:show(root)
    self.super.show(self,root)
    local cb_fun = function( ... )
            self:showFinishCall()
        end
    if self.showAction then
        self.shouchong_layout:setScale(0)
        local seq1 = cc.Sequence:create(cc.EaseBackOut:create(cc.ScaleTo:create(0.2, 1)),cc.CallFunc:create(cb_fun))
        self.shouchong_layout:runAction(seq1);
    end
end

function ShouChongAward:showFinishCall()
    self:tabClick(self.dayBtn[self.tag])
end

function ShouChongAward:destroy()
    -- for i=1,5 do
    --     local e = self["effect"..i]
    --     if e then
    --         e:destroy()
    --         e = nil
    --     end
    -- end
    -- game_app:CancelGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+311, self.OnPrivate311)
    -- game_app:CancelGameNotify(GameConfig.PRIVATE_STATE_UPDATE_ONE+281, self.OnPrivate311)
    -- NetWorkHandleMsg.RemoveMsgHandleBySender(self)
    self.super.destroy(self)
end

return ShouChongAward