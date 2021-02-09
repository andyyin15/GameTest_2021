--
--Author:yinhuawang
--Date: 2020/12
--Function:摇钱树礼包tips
--
-- RockTreeLiBaoTip
local RockTreeLiBaoTip = class("RockTreeLiBaoTip", cc.Node)


function RockTreeLiBaoTip:ctor(_skillId, x, y, _isshow)

	self._widget = cc.CSLoader:createNode("UI/pet/PetSkillTips.csb")
	self._widget:setAnchorPoint(cc.p(0.5, 0.5))
	self:addChild(self._widget)
	self.black=self._widget:getChildByName("black")
	self.black:setContentSize(cc.size(SCREEN_SIZE.width,SCREEN_SIZE.height))
	self.black:addClickEventListener(handler(self, self.closeBack))
	self.window = self._widget:getChildByName("window")
	self.name = self.window:getChildByName("name")
	self.active = self.window:getChildByName("active")
	self.rich_node = self.window:getChildByName("rich_node")
	self.btn_buy = self.window:getChildByName("btn_buy")
	-- self.btn_buy:addClickEventListener(handler(self, self.callBack))
	self.titleLabel = self.window:getChildByName("titleLabel")
	self.desc_1 = self.window:getChildByName("desc_1")
	self.desc_1:setPositionX(self.desc_1:getPositionX()-5)
	self.desc_3 = self.window:getChildByName("desc_3")

	self.richText = ccui.RichText:create()
	self.richText:ignoreContentAdaptWithSize(false)
	self.richText:setAnchorPoint(0,1)
	self.richText:setWrapMode(1)
	self.richText:setHorizontalAlignment(0)
	self.richText:setTouchEnabled(false)
	self.richText:setContentSize(cc.size(250,70))
	self.richText:setText("", nil, 19)
	self.richText:formatText()
	self.rich_node:addChild(self.richText)

	


    if not _isshow then
        self.btn_buy:setVisible(false)
    end
	
    if x and y then
        self.window:setPosition(cc.p(x, y))
    end

    self:initContent()

end

function RockTreeLiBaoTip:initContent()
	self.name:setString("亿元聚宝盆")
	self.name:setPositionX(self.name:getPositionX()-2)
	self.titleLabel:setString("财神特权")
	self.desc_1:setString("特权说明:")
	self.active:setString("购买礼包")
	self.desc_3:setString("特权说明：")
	-- self.richText:setText("财神特权最高可获得10倍暴击奖励")
	self.richText:setText(string.format("<COLOR VALUE=%s>%s</COLOR>", "09f405", "财神特权最高可获得10倍暴击奖励"))

	self.btn_buy:setVisible(true)
	self.btn_buy:setTitleText("已购买")
	self.btn_buy:setEnabled(false)
end

function RockTreeLiBaoTip:closeBack(sender)
	self:removeSelf()
end

return RockTreeLiBaoTip