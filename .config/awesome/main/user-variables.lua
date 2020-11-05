--[[

    用户变量

--]]

-- 获取家目录
local home = os.getenv("HOME");

-- 定义相关变量
local userVariate = {

	terminal = "urxvt";
	modkey = "Mod4";
	altkey = "Mod1";
	chosen_theme = "sky";
	editor = "nvim";
	gui_editor = "nvim-qt";
	browser = "google-chrome-stable";
};

return userVariate;
