--
--Author:lihengjin
--Date: 2020/4/13
--Function:摇钱树单元
--

local RockTreeRankCell = class("RockTreeRankCell", cc.Node)

function RockTreeRankCell:ctor(_parent)
	self.parent = _parent
	self.widget = cc.CSLoader:createNode("UI/rockTree/RockTreeRankCell.csb")
	self:addChild(self.widget)

	self.bg = self.widget:getChildByName("bg")
	self.rank_img = self.bg:getChildByName("rank_img")
	self.rank_txt = self.bg:getChildByName("rank_txt")
	self.player_name = self.bg:getChildByName("player_name")
	self.times = self.bg:getChildByName("times")
end

function RockTreeRankCell:updateContent(data)
	self.rank_img:setVisible(false)
	self.rank_txt:setVisible(false)
	if data.ranking <= 3 then
		self.rank_img:setVisible(true)
		self.rank_img:loadTexture(string.format("nimg_diyi_%d.png", data.ranking), 1)
	else
		self.rank_txt:setVisible(true)
		self.rank_txt:setString(data.ranking)
	end

	self.player_name:setString(data.name)
	self.times:setString(data.level)
	self:showTextColor(data)
end

function RockTreeRankCell:showTextColor(data)
	if data.ranking == 1 then
		self.player_name:setTextColor(cc.c3b(237, 191, 0))
		self.times:setTextColor(cc.c3b(237, 191, 0))
	elseif data.ranking == 2 then
		self.player_name:setTextColor(cc.c3b(216, 0, 255))
		self.times:setTextColor(cc.c3b(216, 0, 255))
	elseif data.ranking == 3 then
		self.player_name:setTextColor(cc.c3b(63, 129, 249))
		self.times:setTextColor(cc.c3b(63, 129, 249))
	else
		self.player_name:setTextColor(cc.c3b(255, 242, 183))
		self.times:setTextColor(cc.c3b(255, 242, 183))
	end
end

return RockTreeRankCell