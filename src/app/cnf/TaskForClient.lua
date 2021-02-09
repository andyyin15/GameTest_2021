GameConfig.TaskForClient={
	[201] = {
		name = "转生神殿",
		des = "    根据不同转生等级挑战不同转生<BR>神殿，层数越高，掉落装备越好",
		limit = {
			{des = "转生神殿一层（69级以上）" ,consumId = 13002,consumNum = 1},
			{des = "转生神殿二层（1转）" ,consumId = 13002,consumNum = 1},
			{des = "转生神殿三层（2转-3转）" ,consumId = 13002,consumNum = 1},
			{des = "转生神殿四层（4转-5转）" ,consumId = 13002,consumNum = 1},
			{des = "转生神殿五层（6转-7转）" ,consumId = 13002,consumNum = 1},
			{des = "转生神殿六层（8转-9转）" ,consumId = 13002,consumNum = 2},
			{des = "转生神殿七层（10转以上）" ,consumId = 13002,consumNum = 2}
		},
	},
	[312] = {
		name = "迷失禁地",
		des = "    根据不同转生等级挑战不同迷失<BR>禁地，层数越高，掉落装备越好",
		map_list = {317,318,319,320,321,322},
		limit = {
			{des = "迷失禁地一层（70级-2转）" ,consumId = 13005,consumNum = 1},
			{des = "迷失禁地二层（3转-4转）" ,consumId = 13005,consumNum = 1},
			{des = "迷失禁地三层（5转-6转）" ,consumId = 13005,consumNum = 1},
			{des = "迷失禁地四层（7转以上）" ,consumId = 13005,consumNum = 1},
			{des = "迷失禁地五层（9转以上）" ,consumId = 13005,consumNum = 1},
			{des = "迷失禁地六层（10转以上）" ,consumId = 13005,consumNum = 1},
		},
	},
	[10]={
		name="城主之刃",
		des = [=[
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>活动时间：<COLOR VALUE=FF00FF00>18:00-18:15<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>等级需求：<COLOR VALUE=FF00FF00>70级<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}>活动地图分为安全区和非安全区，非安全区泡点经验、威望获<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}>有光圈处有多倍经验和威望，不同颜色光圈倍数，地图中存在<BR>
			随机光圈点<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}>此地图玩家PK不红名，死亡不掉落物品<BR>
			击杀玩家可获得大量威望<BR>
		]=],
		award={{itemid=11209,count=1,bind=1},}
	},
	[209] = {
		name = "元宝猪王",
		des = [=[
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>活动时间：<COLOR VALUE=FF00FF00>11:30-12:00  15:00-15:30<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>等级需求：<COLOR VALUE=FF00FF00>65级<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>场景中固定位置会刷新<COLOR VALUE=FF00FF00>15<COLOR VALUE=FFD0BF81>只白猪，击败后会刷<BR>新元宝猪王<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>击杀元宝猪王会掉落<COLOR VALUE=FF00FF00>元宝<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>此活动地图非安全区<COLOR VALUE=FFFF0000>死亡有机率掉落装备<BR>
		]=],
		itemList = {
			{itemid = 11202,count = 1,bind = 1}
		}
	},
	[210] = {
		name = "神医华佗",
		des = " 只要你给我一定的货币我就可以让你<BR>瞬间满血",
		consum_des = [=[
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>消耗：%s<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFD0BF81>消耗：%s<BR>
		]=],
		consumList = {
			50000,50
		}
	},
	[190] = {
		[1] = {
			name = "魔幻迷宫",
			des = [=[
				<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>活动时间：<COLOR VALUE=FF00FF00>16：30-17：00<BR>
				<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>等级需求：<COLOR VALUE=FF00FF00>70级<BR>
				<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>魔幻迷宫共11层，每层只有一个正确的入口前<BR>  往下层，进入错误入口将会后退1-3层<BR>
				<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>到达第10层可领取奖励前往11层，越早到达<BR>  奖励越高<BR>
				<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>11层会刷新BOSS，掉落高级装备，掉落无归属<BR>
				<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FF00FF00>1-9层为安全区，10-11层为非安全区，死亡<BR>  不掉落装备<BR>
			]=],
			itemList = {
				{itemid = 11202,count = 1,bind = 1},
			}
		},
		[2] = {
			name = "魔幻迷宫",
			des = {
				[1] = "<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>第<COLOR VALUE=FF00FF00>1<COLOR VALUE=FFafc3d3>名：",
				[2] = "<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>第<COLOR VALUE=FF00FF00>2<COLOR VALUE=FFafc3d3>名：",
				[3] = "<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>第<COLOR VALUE=FF00FF00>3<COLOR VALUE=FFafc3d3>名：",
				[4] = "<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>第<COLOR VALUE=FF00FF00>4~10<COLOR VALUE=FFafc3d3>名：",
				[5] = "<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>第<COLOR VALUE=FF00FF00>11<COLOR VALUE=FFafc3d3>名以后："
			},
			reward = {
				[1] = "2500绑元+金条（中）x6",
				[2] = "2000绑元+金条（中）x5",
				[3] = "1500绑元+金条（中）x4",
				[4] = "1000绑元+金条（中）x3",
				[5] = "500绑元+金条（中）x2"
			},
		}
	},
	[220] = {
		name = "天下第一",
		itemList = {
			{itemid = 13807,count = 1,bind = 1},
		}
	},
	[314] = {
		name = "灵兽神殿",
		des = [=[
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>活动时间：<COLOR VALUE=FF00FF00>12：40-12：55<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>等级需求：<COLOR VALUE=FF00FF00>70级<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>活动前5分钟属于等待时间，死亡会可重新进入活动<BR>地图<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>活动5分钟后入口关闭，每个玩家有<COLOR VALUE=FF00FF00>3<COLOR VALUE=FFafc3d3>次死亡<BR>复活次数，复活次数耗尽自动退出活<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FFafc3d3>场景中存活最后的玩家将获得特殊奖励<BR>
			<RICHBTN IMG=resource/ui_ex/img_dian_1.png TEXRECT={0,0,20,22}><COLOR VALUE=FF00FF00>场景中PK不掉落物品<BR>
		]=],
		award = {
			{itemid = 13902,count = 1,bind = 1},
		}
	},
	[315] = {
		name = "注灵使者",
		des = [=[<COLOR VALUE=FF9D9665>活动时间：<COLOR VALUE=FF63FD06>周二.周五的21:20到21:50</COLOR><BR><COLOR VALUE=FF9D9665>等级需求：<COLOR VALUE=FF00FF00>2转以上</COLOR><BR><COLOR VALUE=FF9D9665>进入地图通道入传送点随机进入BOSS地图</COLOR><BR><COLOR VALUE=FF9D9665>击杀<COLOR VALUE=FFF8DA0C>灵兽BOSS</COLOR><COLOR VALUE=FF9D9665>和</COLOR><COLOR VALUE=FFF8DA0C>灵兽守卫</COLOR><COLOR VALUE=FF9D9665>必爆<COLOR VALUE=FFF8DA0C>注灵令牌</COLOR><BR><COLOR VALUE=FF9D9665>注灵兑换使者在<COLOR VALUE=FFF8DA0C>灵兽神殿大厅<COLOR VALUE=FF9D9665>出现</COLOR><BR><COLOR VALUE=FF9D9665>活动地图PK不掉落装备]=],
		award_list = {
			"免费领取100注灵值",
			"消耗500元宝领取200注灵值",
			"消耗1888元宝获得400注灵值",
		},
		award = {
			{itemid = 13902,count = 10,bind = 1},
		}
	},
	[301] = {
		name = "BOSS之家",
		sceneid = 306,
		tiaojian = 1,
	},
	[300] = {
		name = "九层妖塔",
		[1] = {
		  award={},
		},
		[2] = {
		  award={{itemid=11204,count=1,bind=1,job=0,},{itemid=11201,count=1,bind=1,job=0,}},
		  xiaohao = 2,
		  next_boss = "蛇王",

		},
		[3] = {
		 award={{itemid=11204,count=1,bind=1,job=0,},{itemid=11201,count=1,bind=1,job=0,}},
		  xiaohao = 4,
		  next_boss = "迷雾蛛王",

		},
		[4] = {
		  award={{itemid=11204,count=1,bind=1,job=0,},{itemid=11201,count=1,bind=1,job=0,}},
		  xiaohao = 8,
		  next_boss = "兽血魔王",

		},
		[5] = {
		  award={{itemid=11204,count=1,bind=1,job=0,},{itemid=11201,count=1,bind=1,job=0,}},
		  xiaohao = 12,
		  next_boss = "雪域魔王",

		},
		[6] = {
		  award={{itemid=11204,count=1,bind=1,job=0,},{itemid=11201,count=1,bind=1,job=0,}},
		  xiaohao = 14,
		  next_boss = "炼狱使者",

		},
		[7] = {
		  award={{itemid=11204,count=1,bind=1,job=0,},{itemid=11201,count=1,bind=1,job=0,}},
		  xiaohao = 16,
		  next_boss = "九幽妖王",

		},
		[8] = {
		  award={{itemid=11204,count=1,bind=1,job=0,},{itemid=11201,count=1,bind=1,job=0,}},
		  xiaohao = 18,
		  next_boss = "神龙王",

		},
		[9] = {
		  award={{itemid=11204,count=1,bind=1,job=0,},{itemid=11201,count=1,bind=1,job=0,}},
		  xiaohao = 20,
		  next_boss = "冰霜巨狼",
		},

	},
	[319] = {
		name = "贵族领地",
		mapId = {1,2,3},
		mapId = {1,2,3},
		payGold = {1000,10000,50000},
		itemList = {
			{{itemid = 27033,count = 1,bind = 0},{itemid = 27034,count = 1,bind = 0},{itemid = 27035,count = 1,bind = 0},},
			{{itemid = 50337,count = 1,bind = 0},{itemid = 50338,count = 1,bind = 0},{itemid =26036,count = 1,bind = 0},},
			{{itemid = 26042,count = 1,bind = 0},{itemid = 26043,count = 1,bind = 0},{itemid = 26044,count = 1,bind = 0},},
		}
	},
}