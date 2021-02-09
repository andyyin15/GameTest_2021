
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"
require "packages.mvc.SuperClass"
-- require "app.manager.GameUIManager"
-- require "app.manager.UI_CONFIG"

local function main()
    require("app.MyApp"):create():run()
    -- local shouchong = require("app.views.ShouChongAward.ShouChongAward")
    -- shouchong:ctor()
    -- shouchong:create()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
	-- print(debug.traceback())
    print(msg)
end
