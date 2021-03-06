--
-- Author: ping
-- Date: 2017-12-29 17:51:54
-- ui面板配置
GameConfig = GameConfig or {}

GameConfig.UI_CREATE_ROLE 		= 10001 --创建角色界面
GameConfig.UI_SELECTE_ROLE 		= 10002 --选择角色界面
GameConfig.UI_LOADING 			= 10003 --加载界面
GameConfig.UI_TESTUI 			= 99999 --加载界面
GameConfig.UI_MUCHTIP_PANEL 	= 99998 --独立显示tip界面
GameConfig.UI_MHMG_REWARD_PANEL = 1901  --魔幻迷宫领奖面板
GameConfig.UI_JCYT_REWARD_PANEL = 3001  --九层妖塔每层奖励
GameConfig.UI_ROLE_PANEL 		= 2     --角色界面
GameConfig.UI_BUFF_PANEL 		= 3     --buff界面
GameConfig.UI_BAG_PANEL			= 5     --背包界面
GameConfig.UI_EQUIP 			= 6     --强化面板
GameConfig.UI_NPCWAREHOSE 		= 7	    -- npc仓库面板
GameConfig.UI_TRADE_PANEL		= 11	-- 交易面板
GameConfig.UI_SYS_SETTINGS      = 16    -- 系统设置
GameConfig.UI_RANK_LIST         = 18    --排行榜
GameConfig.UI_SOCIETY 			= 19    --公会面板
GameConfig.UI_TASK_TALK_PANEL   = 50    --npc任务对话面板
GameConfig.UI_TASK_PANEL		= 51    --npc任务面板
GameConfig.UI_NPC_CUSTOM_PANEL  = 52    -- NPC功能面板
GameConfig.UI_RECYCLE_TASK_PANEL= 53    -- 回收任务面板
GameConfig.UI_NPCAVOIDDROPLETS_PANEL= 54   --避水珠任务
GameConfig.UI_CHAT_PANEL 		= 60    --聊天面板
GameConfig.UI_SKILL_PANEL       = 61    --技能面板
GameConfig.UI_VIP_PANEL 		= 70    --VIP面板
GameConfig.UI_SHOUCHONG_PANEL   = 98    --首充界面
GameConfig.UI_BOSS_PANEL		= 121   --boss面板
GameConfig.UI_MAIL_PANEL        = 122   ---邮件面板
GameConfig.UI_OFFICER_PANEL     = 151   --官职
GameConfig.UI_WING_PANEL 		= 152   --翅膀界面
GameConfig.UI_FORGE_PANEL   	= 153   --锻造
GameConfig.UI_GUAJI_PANEL		= 154	--离线挂机
GameConfig.UI_FRIEND	 		= 158   --好友面板
GameConfig.UI_TEAM              = 159   --组队系统界面
GameConfig.UI_MAP_PANEL 		= 167   --地图
GameConfig.UI_STORE 			= 168   --商城
GameConfig.UI_OROLE_PANEL 		= 171 --查看他人面板
GameConfig.UI_HERO_PANEL		= 172   --英雄
GameConfig.UI_CYFASHIONABLE_PANEL= 173  --衣橱
GameConfig.UI_CLFB_PANEL 		= 175   --材料副本
GameConfig.UI_XYFM_PANEL		= 176   --降妖伏魔
GameConfig.UI_SERVERBOX_PANEL	= 178   --服务器控制系统弹框
GameConfig.UI_BIAOCHE_PANEL 	= 181   --押镖面板
GameConfig.UI_DAILY_PANEL 		= 183   --日常面板
GameConfig.UI_WORSHIP_PANEL 	= 184   --膜拜城主
GameConfig.UI_CYRECYCLE_PANEL 	= 186   --回收面板单独
GameConfig.UI_CITYWAR_PANEL     = 188   --攻城争霸界面
GameConfig.UI_FBFUHUO_TIPS		= 189   --区别于复活系统的副本特殊复活面板
GameConfig.UI_MHMG_PANEL 		= 190   --魔幻迷宫面板
GameConfig.UI_WELFARE_PANEL     = 194   --福利
GameConfig.UI_TREASURE			= 195   --挖宝界面
GameConfig.UI_TRANSFER_PANEL	= 197   --地图传送NPC面板
GameConfig.UI_CHENGJIU_Panel	= 199   --成就系统
GameConfig.UI_ZSSD_PANEL		= 201   --转生神殿
GameConfig.UI_DAILYRECHARGE 	= 203   --每日充值面板
GameConfig.UI_KFHD_PANEL        = 206	--开服活动
GameConfig.UI_WELCOME_PANEL     = 208   --欢迎界面
GameConfig.UI_YBZW_PANEL 		= 209   --元宝猪王
GameConfig.UI_SYHT_PANEL 		= 210   --神医华佗
GameConfig.UI_CZZR_PANEL 		= 212   --激情泡点
GameConfig.UI_MYSD_PANEL 		= 213   --玛雅神殿第一层
GameConfig.UI_MMLD_PANEL 		= 220   --天下第一(蒙面乱斗)
GameConfig.UI_WZAD_PANEL		= 221   --未知暗殿
GameConfig.UI_MYSDDW_PANEL 		= 222   --玛雅神殿第五层
GameConfig.UI_XQTH_PANEL 		= 225   --新区特惠
GameConfig.UI_XYDZP_PANEL       = 226   --幸运大转盘
GameConfig.UI_STRATEGY_PANEL    = 227   --新手攻略
GameConfig.UI_QMDB_PANEL 		= 229   --全民夺宝
GameConfig.UI_JCYT_PANEL 		= 300   --九层妖塔提示入口
GameConfig.UI_BOSSTISI_PANEL    = 301   --BOSS之家提示入口
GameConfig.UI_CYSMSZ_PANEL 		= 303   --石墓试炼界面
GameConfig.UI_MAYDAY_PANEL	    = 306	-- 五月活动
GameConfig.UI_CYSMDL_PANEL		= 308   --跨服远征界面
GameConfig.UI_RXHD_PANEL		= 309   --热血活动
GameConfig.UI_CYMSJD_PANEL		= 312	--迷失禁地
GameConfig.UI_CYXZHL_PANEL		= 313	--下载好礼
GameConfig.UI_CYLSSD_PANEL		= 314   --灵兽神殿
GameConfig.UI_CYLSSZ_PANEL		= 315   --注灵使者
GameConfig.UI_ZZDT_PANEL        = 319   --赞助地图
GameConfig.UI_SUPER_BOOM_PANEL  = 323  --超爽大爆
GameConfig.UI_GODCLOTHES_PANEL  = 324   --龙皇神装
GameConfig.UI_PETBB_PANEL       = 325   --宠物界面
GameConfig.UI_ARTIFACT_PANEL	= 326   --神器
GameConfig.UI_SHENGQI_PANEL     = 327   --圣器
GameConfig.UI_EQUIPRECYCLE_PANEL= 328   -- 钻石回收
GameConfig.UI_RENTPET_PANEL     = 329   --宠物租赁
GameConfig.UI_WEEKENDACT_PANEL  = 332	--感恩活动
GameConfig.UI_KHQD_PANEL		= 333	--狂欢庆典
GameConfig.UI_HEFU_PANEl	    = 334   -- 合服活动
GameConfig.UI_GIFT_PANEL        = 335   --麻痹礼包
GameConfig.UI_CYFUNCOPEN_PANEL  = 336   --功能开启
GameConfig.UI_TIMELIMIT_PANEL	= 337   --限时任务
GameConfig.UI_MOHE_PANEL        = 338   --魔盒
GameConfig.UI_INVEST_PANEL      = 339   --投资 
GameConfig.UI_TUPU_PANEL        = 342   --图谱
GameConfig.UI_MONSTERTOWER_PANEL= 346   -- 妖塔
GameConfig.UI_DOUBLEKNIFE_PANEL = 347   --神兵系统
GameConfig.UI_SDZS_PANEL		= 348	--双刀活动
GameConfig.UI_SDLB_PANEL        = 349   --双刀礼包
GameConfig.UI_RYBOX_PANEL		= 350	--任意自选宝箱 
GameConfig.UI_GOLDJFILLHALL_PANEL= 351  --金玉满堂
GameConfig.UI_SKYLIGHT_PANEL    = 352  -- 天灯
GameConfig.UI_ATK_DICE_PANEL	= 353  	-- 攻击骰子
GameConfig.UI_HEFU_MAP          = 354   -- 合区地图
GameConfig.UI_DFW_PANEL         = 355   --大富翁
GameConfig.UI_LMHD_PANEL        = 356   -- 六脉活动
GameConfig.UI_GZYL_PANEL		= 357   -- 关注有礼
GameConfig.UI_VIPKF_PANEL       = 358   --vip客服
GameConfig.UI_PET_ATK_DICE_PANEL= 361 	-- 宠物攻击骰子
GameConfig.UI_VIPSHOP_PANEL     = 362   --贵族商城
GameConfig.UI_PASS_REWARD_PANEL = 363   -- 副本结算奖励面板
GameConfig.UI_FIVE_TWENTY_PANEL = 364   -- 520活动
GameConfig.UI_DEATH_PANEL   	= 365   -- 死亡弹出面板
GameConfig.UI_HP_DICE_PANEL		= 366 	-- 生命骰子
GameConfig.UI_EquimentAppraisal_PANEL  = 369 --飞升装备鉴定
GameConfig.UI_EquipmentQuenching_PANEL = 370 --装备淬炼
GameConfig.UI_XGYW_PANEL            = 371   --仙宫野外地图副本
GameConfig.UI_AWAKE_PANEL           = 372   -- 人物觉醒
GameConfig.UI_TREASURE_TOWER_PANEL	= 373   -- 藏宝阁
GameConfig.UI_NPCILORD_PANEL	    = 375   -- 震天仙主
GameConfig.UI_ROLEHAT_PANEL         = 379   -- 面具系统
GameConfig.UI_HAT_ACTIVITY_PANEL    = 380   -- 面具活动
GameConfig.UI_BATTLE_RESULT_PANEL   = 381   -- 竞技场结算面板
GameConfig.UI_NPCSGZC_PANEL         = 382   -- 三国战场npc面板
GameConfig.UI_NPCHAT_PANEL          = 383   -- 面具npc面板
GameConfig.UI_SIXWEAPON_PANEL       = 384   -- 六道神兵
GameConfig.UI_TIMELIMITACT_PANEL	= 388	-- 限时活动
GameConfig.UI_MID_AUTUMN_PANEL      = 395   -- 十月金秋
GameConfig.UI_LUCKY_DICE_PANEL      = 396   -- 幸运砸金蛋
GameConfig.UI_XGSTORE_PANEL         = 397   -- 仙宫商店
GameConfig.UI_XGFENJIE_PANEL        = 398   -- 仙宫分解
GameConfig.UI_SHI_YI_PANEL          = 399   -- 欢度金秋
GameConfig.UI_THIRD_DFW_PANEL       = 400   -- 第三日大富翁
GameConfig.UI_SWORN_PANEL           = 403   --结义系统
GameConfig.UI_YSBAOSHI_PANEL        = 404    --魂装
GameConfig.UI_SWORN_DAILY_REWARD_PANEL    = 408  --结义签到
GameConfig.UI_SWORN_TASK_PANEL      = 410    --结义任务
GameConfig.UI_SWORN_TEQUAN_PANEL    = 409    --结义特权
GameConfig.UI_SWORN_SHOP_PANEL      = 411    --结义商城
GameConfig.UI_SWORN_FUBEN_PANEL     = 406    --结义副本
GameConfig.UI_XINGYAO_PANEL         = 389     --星耀特权
GameConfig.UI_WQGIFT_PANEL        	= 412    --武曲礼包
GameConfig.UI_LSGIFT_PANEL        	= 413    --雷神礼包
GameConfig.UI_FENSHEN_ACTIVITY_PANEL= 414    --分身活动
GameConfig.UI_WBLOOD_PANEL        	= 415    --热血特权
GameConfig.UI_PREFESSION_ADVANCE_PANEL    = 416  --职业进阶
GameConfig.UI_SocietyRecomm_PANEL   = 390  	 --帮派推荐			
GameConfig.UI_CHUANSONG_TIPS        = 101    --传送tips
GameConfig.UI_SPIRIT_TIEM_TIPS      = 102    --精灵时间tips
GameConfig.UI_FANLI_PANEL		    = 417    --天天返利
GameConfig.UI_TJHB_PANEL			= 345	 --天降红包
GameConfig.UI_GHDT_PANEL			= 418	 --公会答题
GameConfig.UI_CHARGE_GIFT           = 419    --充值礼包(变强必购)
GameConfig.UI_ROCK_TREE             = 420    --摇钱树
GameConfig.UI_BAIPIAO_GIFT          = 421    --白漂礼包
GameConfig.UI_CYCHECKPROTOCAL       = 503    --提供给服务器自测协议界面
GameConfig.UI_YYDB_PANEL          	= 422    --一元夺宝
GameConfig.UI_YYDBSHOP_PANEL        = 423    --一元夺宝商店
GameConfig.UI_FLYSWORD_PANEL        = 424    --飞剑系统
GameConfig.UI_FLYSWORD_MAP_PANEL    = 425    --飞剑地图
GameConfig.UI_FLYSWORD_ACT_PANEL    = 426    --飞剑活动
GameConfig.UI_XYHL_PANEL 		    = 427    --幸运豪礼
GameConfig.UI_WLMB_PANEL 		    = 428    --武林秘宝
GameConfig.UI_GUAJI_TUJING_PANEL    = 429    --挂机任务途径
GameConfig.UI_HS_STORE              = 402    --黑市商人
GameConfig.UI_RAGE_POWER            = 430    --狂暴之力
GameConfig.UI_PKBATTLERESULT_PANEL  = 431    --竞技pk结算
GameConfig.UI_PKFBFUHUO_TIPS        = 432    --竞技pk复活提示
GameConfig.UI_RECHARGETODAY_PANEL   = 433    --今日充值
GameConfig.UI_COMPOSE_PANEL         = 434    --合成
GameConfig.UI_FASHION_TIEM_TIPS     = 435    --时装时间tips
GameConfig.UI_TASKEND_TIPS     		= 436    --主线任务结束tips
GameConfig.UI_CHONGZHI_TIPS     	= 437    --充值卡使用tips
GameConfig.UI_LUCKYSTAR_PANEL     	= 438    --福星高照
GameConfig.UI_HLZP_PANEL     		= 439    --豪礼转盘
GameConfig.UI_HLSHOP_PANEL     		= 440    --豪礼商店
GameConfig.UI_FEISHENG_ACTIVITY     = 441    --飞升活动
GameConfig.UI_QNBS_ACTIVITY			= 1039	 --全能宝石活动
GameConfig.UI_DRAGONSHIELD_PANEL    = 442    --龙盾
GameConfig.UI_DRAGONACTIVITY_PANEL  = 443    --龙盾活动
GameConfig.UI_WEEKENDRESET_PANEL  	= 444    --双倍重置
GameConfig.UI_MSLB_PANEL  			= 445    --秘书礼包
GameConfig.UI_YITIAN_PANEL  		= 771    --倚天界面
GameConfig.UI_LUCKY_CRYSTAL_PANEL  	= 779    --水晶夺宝
GameConfig.UI_ZLLB_PANEL        	= 446    --战力礼包
GameConfig.UI_VIP_CERTIFICATION_PANEL     = 447    --VIP认证
GameConfig.UI_MAP_GUAJI_PANEL             = 448   --地图挂机
GameConfig.UI_RISINGSTAR_PANEL      = 449    --装备升星
GameConfig.UI_DSX_PANEL      		= 450    --都市行
GameConfig.UI_VIPUP_PANEL      		= 451    --vip提升弹窗
GameConfig.UI_THREEREB_PANEL      	= 452    --周一豪礼
GameConfig.UI_NEWDFW_PANEL      	= 453    --新大富翁
GameConfig.UI_NEW_WEEKDAY_ACTIVITY  = 454     --新版周末活动
GameConfig.UI_MSJP_PANEL      		= 455    --免死金牌
GameConfig.UI_LOONGTOWER_PANEL      = 456    --龙纹塔
GameConfig.UI_MSJP_ACTIVITY      	= 457    --免死金牌活动
GameConfig.UI_FENGSHENG_MAIN_PANEL	= 459    --封神系统
GameConfig.UI_SPIRITISM_ACTIVITY  	= 458    --招魂活动
GameConfig.UI_FENGSHEN_ACTIVITY  	= 460    --封神活动
GameConfig.UI_WELCOME_ACTIVITY  	= 700    --小七迎新活动
GameConfig.UI_FENGSHENLB_PANEL  	= 461    --封神礼包
GameConfig.UI_SMDK_ACTIVITY  		= 462    --神秘洞窟
GameConfig.UI_DRAGONPALACE_PANEL    = 464   --龙宫系统
GameConfig.UI_SEAGOD_ACTIVITY  		= 463    --龙宫活动
GameConfig.UI_WEEKGIFT_PANEL  		= 465    --护体礼包、海洋之心
GameConfig.UI_ICESNOW_ACTIVITY  	= 466	 --冰雪狂欢
GameConfig.UI_KEYINGIFT_PANEL  		= 500    --刻印礼包
GameConfig.UI_LWLB_PANEL		  	= 467	 --龙纹礼包
GameConfig.UI_MRCZ_PANEL		  	= 468	 --每日充值
GameConfig.UI_FLYSWORD_ACTIVITY		= 469	 --新飞剑活动
GameConfig.UI_FJLB_PANEL			= 470	 --飞剑礼包
GameConfig.UI_DAILYYB				= 471	 --亿元聚宝盆
GameConfig.UI_PRIVACY_PANEL			= 472	 --隐私协议
GameConfig.UI_ROCK_TREE_LB_PANEL	= 473	 --摇钱树礼包
GameConfig.UI_SRLB_PANEL			= 474	 --神刃礼包
GameConfig.UI_CHRISTMAS_PANEL	    = 475	 --圣诞节活动
GameConfig.UI_TWOKNIFE_ACTIVITY		= 476	 --新神兵活动
GameConfig.UI_MASK_ACTIVITY			= 477	 --新面具活动
GameConfig.UI_YDHD_ACT_PANEL        = 600    -- 元旦活动

--ui字典

_ui_create_table = {
	[GameConfig.UI_CREATE_ROLE]  	= 	"scripts/UI/Dlg/account/CreateRoleUI",
	[GameConfig.UI_SELECTE_ROLE] 	= 	"scripts/UI/Dlg/account/SelectRoleUI",
	[GameConfig.UI_LOADING]      	= 	"scripts/UI/Dlg/loading/LoadingUI",
	[GameConfig.UI_TESTUI]      	= 	"scripts/UI/Dlg/TestUI",
	[GameConfig.UI_ROLE_PANEL]      = 	"scripts/UI/Dlg/role/RolePanel",
	[GameConfig.UI_BUFF_PANEL]      = 	"scripts/UI/Dlg/main/BuffPanel",
	[GameConfig.UI_WING_PANEL]      = 	"scripts/UI/Dlg/wing/WingMainPanel",
	[GameConfig.UI_CHAT_PANEL]		=	"scripts/UI/Dlg/chat/ChatPanel",
	[GameConfig.UI_SOCIETY]			=	"scripts/UI/Dlg/society/SocietyPanel",
	[GameConfig.UI_CYXZHL_PANEL]	=	"scripts/UI/Dlg/activity/XiaZaiHaoLiPanel",
	[GameConfig.UI_STORE]			=	"scripts/UI/Dlg/store/StorePanel",
	[GameConfig.UI_BAG_PANEL]		=	"scripts/UI/Dlg/bag/BagPanel",
	[GameConfig.UI_EQUIP]			=	"scripts/UI/Dlg/strengthen/StrengthenPanel",
	[GameConfig.UI_DAILY_PANEL]		=	"scripts/UI/Dlg/daily/DailyPanel",
	[GameConfig.UI_VIP_PANEL]		=	"scripts/UI/Dlg/vip/VipMainPanel",
	[GameConfig.UI_TASK_PANEL]		=	"scripts/UI/Dlg/task/TaskPanel",
	[GameConfig.UI_MAP_PANEL]		=	"scripts/UI/Dlg/map/MapPanel",
	[GameConfig.UI_DAILYRECHARGE]	=	"scripts/UI/Dlg/activityPay/DailyRechargePanel",
	[GameConfig.UI_CLFB_PANEL]      =   "scripts/UI/Dlg/clfb/CLFBPanel",
	[GameConfig.UI_XYFM_PANEL]		=	"scripts/UI/Dlg/task/XYFMPanel",
	[GameConfig.UI_TREASURE]		=	"scripts/UI/Dlg/treasure/TreasurePanel",
	[GameConfig.UI_BOSS_PANEL]		=	"scripts/UI/Dlg/boss/BossPanel",
	[GameConfig.UI_BIAOCHE_PANEL]	=	"scripts/UI/Dlg/activity/BiaoChePanel",
	[GameConfig.UI_MUCHTIP_PANEL]	=	"scripts/UI/Dlg/MuchTipPanel",
	[GameConfig.UI_SERVERBOX_PANEL]	=	"scripts/UI/Dlg/ServerMessagePanel",
	[GameConfig.UI_HERO_PANEL]		=	"scripts/UI/Dlg/hero/HeroPanel",
	[GameConfig.UI_TRANSFER_PANEL]  =	"scripts/UI/Dlg/npc/NPCTransferPanel",
	[GameConfig.UI_CHENGJIU_Panel]  =	"scripts/UI/Dlg/chengjiu/ChengJiuPanel",
	[GameConfig.UI_FORGE_PANEL]     =   "scripts/UI/Dlg/forge/ForgeMainPanel",
	[GameConfig.UI_CZZR_PANEL]		=	"scripts/UI/Dlg/activity/JQPDPanel",
	[GameConfig.UI_MHMG_PANEL]		=	"scripts/UI/Dlg/activity/MHMGPanel",
	[GameConfig.UI_MHMG_REWARD_PANEL]=	"scripts/UI/Dlg/activity/MHMGrewardPanel",
	[GameConfig.UI_YBZW_PANEL]		=	"scripts/UI/Dlg/activity/YBZWPanel",
	[GameConfig.UI_CYLSSD_PANEL]	=	"scripts/UI/Dlg/activity/LSSDPanel",
	[GameConfig.UI_CYLSSZ_PANEL]   	=   "scripts/UI/Dlg/activity/ZLSZPanel",
	[GameConfig.UI_JCYT_PANEL]		=	"scripts/UI/Dlg/activity/JCYTPanel",
	[GameConfig.UI_JCYT_REWARD_PANEL]=	"scripts/UI/Dlg/activity/JCYTrewardPanel",
	[GameConfig.UI_MMLD_PANEL]		=	"scripts/UI/Dlg/activity/TXDYPanel",
	[GameConfig.UI_QMDB_PANEL]		=	"scripts/UI/Dlg/activity/QMDBPanel",
	[GameConfig.UI_OFFICER_PANEL]   =   "scripts/UI/Dlg/officer/OfficerPanel",
	[GameConfig.UI_BOSSTISI_PANEL]	=	"scripts/UI/Dlg/npc/BossHomePanel",
	[GameConfig.UI_MYSD_PANEL]		=	"scripts/UI/Dlg/npc/MYSDPanel",
	[GameConfig.UI_MYSDDW_PANEL]	=	"scripts/UI/Dlg/npc/MYSDDWPanel",
	[GameConfig.UI_SYHT_PANEL]   	=   "scripts/UI/Dlg/npc/HuaTuoPanel",
	[GameConfig.UI_CYSMSZ_PANEL]    =   "scripts/UI/Dlg/npc/SMSLPanel",
	[GameConfig.UI_ZSSD_PANEL]		=   "scripts/UI/Dlg/npc/ZSSDPanel",
	[GameConfig.UI_CYMSJD_PANEL]	=   "scripts/UI/Dlg/npc/MSJDPanel",
	[GameConfig.UI_WZAD_PANEL]		=   "scripts/UI/Dlg/npc/WZADPanel",
	[GameConfig.UI_SKYLIGHT_PANEL]  =   "scripts/UI/Dlg/npc/TDJDPanel",
	[GameConfig.UI_NPCWAREHOSE]		=   "scripts/UI/Dlg/bag/WarehousePanel",
	[GameConfig.UI_WORSHIP_PANEL]	=   "scripts/UI/Dlg/npc/MBPanel",
	[GameConfig.UI_CYRECYCLE_PANEL]	=   "scripts/UI/Dlg/npc/RecyclePanel_dzy",
	[GameConfig.UI_FRIEND]			=   "scripts/UI/Dlg/friends/FriendsPanel",
	[GameConfig.UI_SHOUCHONG_PANEL] =   "scripts/UI/Dlg/activityPay/ShouChongPanel",
	[GameConfig.UI_STRATEGY_PANEL]  =   "scripts/UI/Dlg/strategy/StrategyPanel",
	[GameConfig.UI_TEAM]            =   "scripts/UI/Dlg/team/TeamPanel",
	[GameConfig.UI_FBFUHUO_TIPS] 	=	"scripts/UI/Dlg/activity/CYFBfuhuoTips",
	[GameConfig.UI_TIMELIMIT_PANEL] =   "scripts/UI/Dlg/timelimit/TimeLimitTaskPanel",
	[GameConfig.UI_MAIL_PANEL ]     =   "scripts/UI/Dlg/mail/MailPanel",
	[GameConfig.UI_SYS_SETTINGS]    =   "scripts/UI/Dlg/set/SetPanel",
	[GameConfig.UI_XYDZP_PANEL]     =   "scripts/UI/Dlg/xydzp/XYDZPPanel",
	[GameConfig.UI_GIFT_PANEL]		=	"scripts/UI/Dlg/gift/GiftPanel",
	[GameConfig.UI_SHENGQI_PANEL]   =   "scripts/UI/Dlg/shengqi/ShengqiPanel",
	[GameConfig.UI_DFW_PANEL]       =   "scripts/UI/Dlg/dfw/DFWPanel",
	[GameConfig.UI_TASK_TALK_PANEL] =   "scripts/UI/Dlg/npc/NPCTalkLandPanel",
	[GameConfig.UI_NPC_CUSTOM_PANEL] =	"scripts/UI/Dlg/npc/NPCTalkPanel",
	[GameConfig.UI_RECYCLE_TASK_PANEL]= "scripts/UI/Dlg/npc/RecycleTaskPanel",
	[GameConfig.UI_NPCAVOIDDROPLETS_PANEL]= "scripts/UI/Dlg/npc/NpcAvoidDropletsPanel",
	[GameConfig.UI_CYFASHIONABLE_PANEL] = "scripts/UI/Dlg/fashion/FashionPanel",
	[GameConfig.UI_CITYWAR_PANEL]   =   "scripts/UI/Dlg/citywar/CityWarPanel",
	[GameConfig.UI_SUPER_BOOM_PANEL]= "scripts/UI/Dlg/activity/SuperBoomLayer",
	[GameConfig.UI_GODCLOTHES_PANEL]=   "scripts/UI/Dlg/godClothes/GodClothesPanel",
	[GameConfig.UI_CYSMDL_PANEL]    =    "scripts/UI/Dlg/acrossserver/AcrossServerPanel",
	[GameConfig.UI_RXHD_PANEL]    	=    "scripts/UI/Dlg/hundredserver/HundredServerPanel",
	[GameConfig.UI_RANK_LIST]       =   "scripts/UI/Dlg/rank/RankPanel",
	[GameConfig.UI_OROLE_PANEL]     =    "scripts/UI/Dlg/role/ORolePanel",	
	[GameConfig.UI_INVEST_PANEL]    =   "scripts/UI/Dlg/activity/NewTZPanel",
	[GameConfig.UI_PETBB_PANEL]     =  "scripts/UI/Dlg/pet/PetPanel",
	[GameConfig.UI_TUPU_PANEL]      =   "scripts/UI/Dlg/tupu/TupuPanel",
	[GameConfig.UI_XQTH_PANEL]      =   "scripts/UI/Dlg/xqth/XQTHPanel",
	[GameConfig.UI_GZYL_PANEL]    =  "scripts/UI/Dlg/gzyl/GZYLPanel",
	[GameConfig.UI_ARTIFACT_PANEL]	=	"scripts/UI/Dlg/shenqi/ShenqiPanel",
    [GameConfig.UI_DOUBLEKNIFE_PANEL] =  "scripts/UI/Dlg/doubleKnife/DoubleKnifePanel",
	[GameConfig.UI_MONSTERTOWER_PANEL]=  "scripts/UI/Dlg/monsterTower/MonsterTowerPanel",
	[GameConfig.UI_KHQD_PANEL]		=   "scripts/UI/Dlg/khqd/KHQDPanel",
	[GameConfig.UI_GUAJI_PANEL]		=   "scripts/UI/Dlg/guaji/GuajiPanel",
	[GameConfig.UI_SKILL_PANEL]     =   "scripts/UI/Dlg/skill/SkillPanel",
	[GameConfig.UI_WELFARE_PANEL]   =   "scripts/UI/Dlg/welfare/WelfarePanel",
    [GameConfig.UI_GOLDJFILLHALL_PANEL] =   "scripts/UI/Dlg/goldJFillHall/GoldJFillHallPanel",
    [GameConfig.UI_VIPKF_PANEL]     =   "scripts/UI/Dlg/vipkf/VIPKFPanel",
	[GameConfig.UI_RENTPET_PANEL]   =   "scripts/UI/Dlg/pet/RentPetPanel",
	[GameConfig.UI_ZZDT_PANEL]      =   "scripts/UI/Dlg/zzdt/ZZDTPanel",
	[GameConfig.UI_WEEKENDACT_PANEL]=   "scripts/UI/Dlg/weekendActivity/WeekendActivityPanel",
	[GameConfig.UI_WELCOME_PANEL]   =   "scripts/UI/Dlg/welcome/WelcomePanel",
	[GameConfig.UI_KFHD_PANEL]      =    "scripts/UI/Dlg/kfhd/KFHDPanel",
	[GameConfig.UI_EQUIPRECYCLE_PANEL]     =   "scripts/UI/Dlg/equipRecycle/EquipRecyclePanel",
	[GameConfig.UI_HEFU_PANEl]     =   "scripts/UI/Dlg/HeFuActivity/HeFuActivityPanel",
	[GameConfig.UI_CYFUNCOPEN_PANEL]     =   "scripts/UI/Dlg/cyfuncOpen/CYfuncOpenPanel",
	[GameConfig.UI_VIPSHOP_PANEL]     =   "scripts/UI/Dlg/vipShop/VIPShopPanel",
	[GameConfig.UI_PASS_REWARD_PANEL]     =   "scripts/UI/Dlg/activity/PassRewardPanel",
	[GameConfig.UI_BATTLE_RESULT_PANEL]   =   "scripts/UI/Dlg/daily/BattleResultPanel",
	[GameConfig.UI_DEATH_PANEL]   		  =   "scripts/UI/Dlg/activity/DeathPanel",
	[GameConfig.UI_TRADE_PANEL]   		  =   "scripts/UI/Dlg/trade/TradePanel",
	[GameConfig.UI_RYBOX_PANEL]   		  =   "scripts/UI/Dlg/public/PubBoxRewardPanel",
	[GameConfig.UI_MOHE_PANEL]            =   "scripts/UI/Dlg/mohe/MoHePanel",
	[GameConfig.UI_AWAKE_PANEL]           =   "scripts/UI/Dlg/awake/AwakePanel",
	[GameConfig.UI_ATK_DICE_PANEL]        =   "scripts/UI/Dlg/dice/DicePanel",
	[GameConfig.UI_PET_ATK_DICE_PANEL]    =   "scripts/UI/Dlg/dice/DicePanel",
	[GameConfig.UI_HP_DICE_PANEL]         =   "scripts/UI/Dlg/dice/DicePanel",
	[GameConfig.UI_SDLB_PANEL]            =   "scripts/UI/Dlg/doubleKnife/SDLBPanel",
	[GameConfig.UI_SDZS_PANEL]			  =	  "scripts/UI/Dlg/twoKinfeActivity/TwoKnifeFillHallLayer",
	[GameConfig.UI_TREASURE_TOWER_PANEL]  =   "scripts/UI/Dlg/treasureTower/TreasureTowerPanel",	
	[GameConfig.UI_TIMELIMITACT_PANEL]	  =   "scripts/UI/Dlg/timeLimitActivity/TimeLimitActPanel",
	[GameConfig.UI_MAYDAY_PANEL]	      =   "scripts/UI/Dlg/mayDay/MayDayPanel",
	[GameConfig.UI_HEFU_MAP]	          =   "scripts/UI/Dlg/npc/NPCHeFuPanel",
	[GameConfig.UI_ROLEHAT_PANEL]	      =   "scripts/UI/Dlg/bambooHat/BambooHatPanel",
    [GameConfig.UI_FIVE_TWENTY_PANEL]     =   "scripts/UI/Dlg/fiveTwenty/FiveTwentyPanel",
    [GameConfig.UI_HAT_ACTIVITY_PANEL]    =   "scripts/UI/Dlg/hatActivity/hatActivityPanel",
    [GameConfig.UI_NPCSGZC_PANEL]         =   "scripts/UI/Dlg/npc/NPCKuaFuPanel",
    [GameConfig.UI_NPCHAT_PANEL]          =   "scripts/UI/Dlg/npc/NPCHatPanel",
    [GameConfig.UI_LUCKY_DICE_PANEL]      =   "scripts/UI/Dlg/dfw/XYDMSPanel",
    [GameConfig.UI_LMHD_PANEL]            =   "scripts/UI/Dlg/sixswords/SixSwordsActPanel",
    [GameConfig.UI_EquipmentQuenching_PANEL] = "scripts/UI/Dlg/role/DujieStrengPanel",
    [GameConfig.UI_EquimentAppraisal_PANEL]  = "scripts/UI/Dlg/role/DujieIdentifyPanel",
    [GameConfig.UI_XGYW_PANEL]            =   "scripts/UI/Dlg/role/DujieXGPanel",
    [GameConfig.UI_XGFENJIE_PANEL]        =   "scripts/UI/Dlg/feisheng/XianGongFJPanel",
    [GameConfig.UI_XGSTORE_PANEL]         =   "scripts/UI/Dlg/feisheng/XianGongStorePanel",
    [GameConfig.UI_SHI_YI_PANEL]          =   "scripts/UI/Dlg/shiYiActivity/ShiYiActivityPanel",
    [GameConfig.UI_THIRD_DFW_PANEL]       =   "scripts/UI/Dlg/dfw/ThirdDFWPanel",
    [GameConfig.UI_SIXWEAPON_PANEL]       =   "scripts/UI/Dlg/sixWeapon/SixWeaponPanel",
    [GameConfig.UI_MID_AUTUMN_PANEL]      =   "scripts/UI/Dlg/midAutumn/MidAutumnPanel",
    [GameConfig.UI_NPCILORD_PANEL]        =   "scripts/UI/Dlg/npc/NPCILordTalkPanel",
    [GameConfig.UI_SWORN_PANEL]           =   "scripts/UI/Dlg/sworn/SwornPanel",
    [GameConfig.UI_YSBAOSHI_PANEL]        =   "scripts/UI/Dlg/immortal/immortalBaoshi",
    [GameConfig.UI_SWORN_DAILY_REWARD_PANEL] = "scripts/UI/Dlg/sworn/SwornDailyRewardPanel",
    [GameConfig.UI_SWORN_TASK_PANEL]      =  "scripts/UI/Dlg/sworn/SwornTaskPanel",
    [GameConfig.UI_SWORN_TEQUAN_PANEL]    =  "scripts/UI/Dlg/sworn/SwornTequanPanel",
    [GameConfig.UI_SWORN_SHOP_PANEL]      =  "scripts/UI/Dlg/sworn/SwornShopPanel",
    [GameConfig.UI_SWORN_FUBEN_PANEL]     =  "scripts/UI/Dlg/sworn/SwornFubenPanel",
    [GameConfig.UI_XINGYAO_PANEL]         =  "scripts/UI/Dlg/xingyao/XingyaoPanel",
    [GameConfig.UI_WQGIFT_PANEL]      	  =  "scripts/UI/Dlg/gift/GiftWQPanel",
    [GameConfig.UI_LSGIFT_PANEL]      	  =  "scripts/UI/Dlg/gift/GiftLSPanel",
    [GameConfig.UI_WBLOOD_PANEL]      	  =  "scripts/UI/Dlg/warmblood/WarmBloodPanel",
    [GameConfig.UI_FENSHEN_ACTIVITY_PANEL]  =  "scripts/UI/Dlg/fenshenActivity/FenshenActivityPanel",
    [GameConfig.UI_PREFESSION_ADVANCE_PANEL ] = "scripts/UI/Dlg/prefessionAdvance/PrefessionAdvancePanel",
    [GameConfig.UI_SocietyRecomm_PANEL ]  = "scripts/UI/Dlg/society/SocietyRecomm",
    [GameConfig.UI_CHUANSONG_TIPS] 		  = "scripts/UI/Dlg/main/ChuanSongTipsNode",
    [GameConfig.UI_SPIRIT_TIEM_TIPS] 	  = "scripts/UI/Dlg/main/SpiritTimeTipsNode",
    [GameConfig.UI_FANLI_PANEL]			  = "scripts/UI/Dlg/activityPay/DailyRechargeAwardLayer",
    [GameConfig.UI_TJHB_PANEL] 			  = "scripts/UI/Dlg/activityPay/TJHBPanel",
    [GameConfig.UI_GHDT_PANEL] 			  = "scripts/UI/Dlg/sworn/SwornAnswerNode",
    [GameConfig.UI_CHARGE_GIFT]           = "scripts/UI/Dlg/chargeGift/ChargeGiftPanel",
    [GameConfig.UI_ROCK_TREE]             = "scripts/UI/Dlg/rockTree/RockTreePanel",
    [GameConfig.UI_BAIPIAO_GIFT]          = "scripts/UI/Dlg/activityPay/DailyBaipiaoPanel",
    [GameConfig.UI_CYCHECKPROTOCAL]       =   "scripts/UI/Dlg/CYCheckProtocal",
    [GameConfig.UI_YYDB_PANEL ]           = "scripts/UI/Dlg/yydb/OneDollarActNode",
    [GameConfig.UI_YYDBSHOP_PANEL ]       = "scripts/UI/Dlg/yydb/YydbStorePanel",
    [GameConfig.UI_FLYSWORD_PANEL]        = "scripts/UI/Dlg/flysword/FlySwordPanel",
    [GameConfig.UI_FLYSWORD_MAP_PANEL]    = "scripts/UI/Dlg/flysword/FlySwordMapPanel",
    [GameConfig.UI_FLYSWORD_ACT_PANEL]    = "scripts/UI/Dlg/flySwordAct/FlySwordActPanel",
    [GameConfig.UI_XYHL_PANEL]   		  = "scripts/UI/Dlg/xydzp/XYHLPanel",
    [GameConfig.UI_WLMB_PANEL]   		  = "scripts/UI/Dlg/xydzp/WLMBPanel",
    [GameConfig.UI_GUAJI_TUJING_PANEL]    = "scripts/UI/Dlg/main/task/GuajiTaskNode",
    [GameConfig.UI_HS_STORE ]             = "scripts/UI/Dlg/store/HsStorePanel",
    [GameConfig.UI_RAGE_POWER]            = "scripts/UI/Dlg/ragepower/RagePowerPanel",
    [GameConfig.UI_PKBATTLERESULT_PANEL]  = "scripts/UI/Dlg/acrossserver/PKBattleResultPanel",
    [GameConfig.UI_PKFBFUHUO_TIPS]        = "scripts/UI/Dlg/activity/KF25V25FBfuhuoTips",
    -- [GameConfig.UI_RECHARGETODAY_PANEL]   = "scripts/UI/Dlg/activityPay/NewDailyRechargePayPanel",
    [GameConfig.UI_COMPOSE_PANEL]         = "scripts/UI/Dlg/bag/ComposePanel",
    [GameConfig.UI_FASHION_TIEM_TIPS]     = "scripts/UI/Dlg/main/FashionTimeTipsNode",
    [GameConfig.UI_TASKEND_TIPS]     	  = "scripts/UI/Dlg/activityPay/wczxTips",
    [GameConfig.UI_CHONGZHI_TIPS]     	  = "scripts/UI/Dlg/main/ChongZhiTipsNode",
    [GameConfig.UI_LUCKYSTAR_PANEL]       = "scripts/UI/Dlg/activityPay/StarPanel",
    [GameConfig.UI_FEISHENG_ACTIVITY]     = "scripts/UI/Dlg/feishengActivity/FeishengActivityPanel",
    [GameConfig.UI_HLZP_PANEL]   		  = "scripts/UI/Dlg/xydzp/HLZPPanel",--
	[GameConfig.UI_HLSHOP_PANEL]   		  = "scripts/UI/Dlg/store/HLStorePanel",
	[GameConfig.UI_QNBS_ACTIVITY]		  = "scripts/UI/Dlg/qnbs/QNBSPanel",
	[GameConfig.UI_DRAGONSHIELD_PANEL]    = "scripts/UI/Dlg/dragonShield/DragonShieldPanel",
	[GameConfig.UI_DRAGONACTIVITY_PANEL]  = "scripts/UI/Dlg/dragonShieldActivity/DragonActivityPanel",
	[GameConfig.UI_WEEKENDRESET_PANEL]    = "scripts/UI/Dlg/weekendActivity/WeekendSBCZPanel",
	[GameConfig.UI_MSLB_PANEL]    		  = "scripts/UI/Dlg/mslb/MSLBPanel",
	[GameConfig.UI_YITIAN_PANEL]    	  = "scripts/UI/Dlg/yitian/YiTianPanel",
	[GameConfig.UI_ZLLB_PANEL]    		  = "scripts/UI/Dlg/doubleKnife/ZLLBPanel",
	[GameConfig.UI_LUCKY_CRYSTAL_PANEL]   = "scripts/UI/Dlg/crystal/CrystalTreasurePanel",
	[GameConfig.UI_VIP_CERTIFICATION_PANEL ]    = "scripts/UI/Dlg/vipCertification/VipCertificationPanel",
	[GameConfig.UI_RISINGSTAR_PANEL]   	  = "scripts/UI/Dlg/risingStar/RisingStarPanel",
	[GameConfig.UI_MAP_GUAJI_PANEL] 	  = "scripts/UI/Dlg/offline/OfflinePanel",
	[GameConfig.UI_DSX_PANEL]      		  = "scripts/UI/Dlg/dsx/DSXPanel",
	[GameConfig.UI_VIPUP_PANEL]      	  = "scripts/UI/Dlg/vip/VipupPanel",
	[GameConfig.UI_THREEREB_PANEL]		  = "scripts/UI/Dlg/activityPay/ThreeRebPanel",
	[GameConfig.UI_NEWDFW_PANEL]      	  = "scripts/UI/Dlg/dfw/NewDFWPanel",
	[GameConfig.UI_NEW_WEEKDAY_ACTIVITY]  = "scripts/UI/Dlg/newWeekdayActivity/NewWeekDayActivityPanel",
	[GameConfig.UI_MSJP_PANEL]      	  = "scripts/UI/Dlg/medallion/MedallionPanel",
	[GameConfig.UI_LOONGTOWER_PANEL]      = "scripts/UI/Dlg/loongTower/LoongTowerPanel",
	[GameConfig.UI_MSJP_ACTIVITY]      	  = "scripts/UI/Dlg/medallionActivity/MedallionActivityPanel",
	[GameConfig.UI_SPIRITISM_ACTIVITY]	  = "scripts/UI/Dlg/spiritismActivity/SpiritismActivityPanel",
	[GameConfig.UI_FENGSHENG_MAIN_PANEL]  =  "scripts/UI/Dlg/fengsheng/FengShengMainPanel",
	[GameConfig.UI_FENGSHEN_ACTIVITY]	  = "scripts/UI/Dlg/fengShenActivity/FengShenActivityPanel",
	[GameConfig.UI_WELCOME_ACTIVITY]	  = "scripts/UI/Dlg/welcomeAcitivity/WelcomeActivityPanel",
	[GameConfig.UI_FENGSHENLB_PANEL]	  = "scripts/UI/Dlg/fengsheng/FengshenGift",
	[GameConfig.UI_SMDK_ACTIVITY]	  	  = "scripts/UI/Dlg/smdk/SMDKPanel",
	[GameConfig.UI_DRAGONPALACE_PANEL]    = "scripts/UI/Dlg/dragonpalace/DragonPalacePanel",
	[GameConfig.UI_SEAGOD_ACTIVITY]	 	  = "scripts/UI/Dlg/seaGodAct/SeaGodActPanel",
	[GameConfig.UI_KEYINGIFT_PANEL]		  = "scripts/UI/Dlg/strengthen/KeyinGiftPanel",
	[GameConfig.UI_WEEKGIFT_PANEL]	 	  = "scripts/UI/Dlg/gift/WeekendGiftPanel",
	[GameConfig.UI_ICESNOW_ACTIVITY]	  = "scripts/UI/Dlg/icesonwActivity/IcesonwPanel",
	[GameConfig.UI_LWLB_PANEL]	  		  = "scripts/UI/Dlg/mslb/LWLBPanel",
	[GameConfig.UI_MRCZ_PANEL]	  		  = "scripts/UI/Dlg/czyl/CZYLPanel",
	[GameConfig.UI_FLYSWORD_ACTIVITY]	  = "scripts/UI/Dlg/newflySwordAct/NewFlySwordActPanel",
	[GameConfig.UI_FJLB_PANEL]    		  = "scripts/UI/Dlg/doubleKnife/FJLBPanel",
	[GameConfig.UI_DAILYYB]    		  	  = "scripts/UI/Dlg/bag/DailyYBLayer",
	[GameConfig.UI_PRIVACY_PANEL]    	  = "scripts/UI/Dlg/main/PrivacyPanel",
	[GameConfig.UI_ROCK_TREE_LB_PANEL]    = "scripts/UI/Dlg/rockTree/RockTreeLlBao",
	[GameConfig.UI_SRLB_PANEL]    		  = "scripts/UI/Dlg/doubleKnife/SRLBPanel",
	[GameConfig.UI_CHRISTMAS_PANEL]       = "scripts/UI/Dlg/ChristmasActivityPanel/ChristmasMainPanel",
	[GameConfig.UI_TWOKNIFE_ACTIVITY]     = "scripts/UI/Dlg/newtwoKnifeAct/NewTwoKnifeActPanel",
	[GameConfig.UI_MASK_ACTIVITY]     	  = "scripts/UI/Dlg/newMaskAct/NewMaskActPanel",
	[GameConfig.UI_YDHD_ACT_PANEL]        = "scripts/UI/Dlg/ydhd/YuanDanMainPanel",
}

