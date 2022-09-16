local home = os.getenv("HOME")
local db = require("dashboard")

db.custom_footer = {
	[["You could leave life right now. Let that determine what you do and say and think."]],
	[[— Marcus Aurelius]],
}
db.preview_command = "cat | lolcat -F 0.3"
db.preview_file_path = home .. "/.config/nvim/static/neovim.cat"
db.preview_file_height = 5
db.preview_file_width = 70
db.custom_center = {
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "DashboardFindHistory",
		shortcut = "SPC f h",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "Telescope file_browser",
		shortcut = "SPC f b",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
}
