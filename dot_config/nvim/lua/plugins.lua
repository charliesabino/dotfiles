-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local function get_config(name)
	return string.format('require("config/%s")', name)
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")
	use("nvim-lua/plenary.nvim")

	use("ful1e5/onedark.nvim")

	use({ "nvim-lualine/lualine.nvim", config = get_config("lualine") })
	use({ "rcarriga/nvim-notify", config = get_config("notify") })
	use({ "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree") })
	use({ "glepnir/dashboard-nvim", config = get_config("dashboard") })

	use("kyazdani42/nvim-web-devicons")

	use({ "lukas-reineke/indent-blankline.nvim", config = get_config("indent-blankline") })

	use({ "neovim/nvim-lspconfig", config = get_config("lsp") })
	use({ "williamboman/mason.nvim", config = get_config("mason") })
	use({ "williamboman/mason-lspconfig.nvim", config = get_config("mason-lspconfig") })

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = get_config("cmp"),
	})

	use({ "nvim-telescope/telescope.nvim", config = get_config("telescope") })

	use({ "nvim-treesitter/nvim-treesitter", config = get_config("treesitter") })
	use("p00f/nvim-ts-rainbow")

	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "kylechui/nvim-surround", config = get_config("surround") })

	use({
		"glacambre/firenvim",
		config = get_config("firenvim"),
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	use("ggandor/lightspeed.nvim")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({ "windwp/nvim-ts-autotag", config = get_config("ts-autotag") })

	use({ "akinsho/toggleterm.nvim", tag = "v1.*", config = get_config("toggleterm") })
	use({ "akinsho/bufferline.nvim", tag = "v2.*", config = get_config("bufferline") })

	use("moll/vim-bbye")

	use({ "jose-elias-alvarez/null-ls.nvim", config = get_config("null-ls") })

	use({ "lewis6991/gitsigns.nvim", config = get_config("gitsigns") })

	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
	})

	use({
		"zbirenbaum/copilot-cmp",
		module = "copilot_cmp",
	})

	use({
		"mrshmllow/document-color.nvim",
		config = function()
			require("document-color").setup({
				-- Default options
				mode = "background", -- "background" | "foreground" | "single"
			})
		end,
	})

	use({ "akinsho/flutter-tools.nvim", config = get_config("flutter-tools"), requires = "nvim-lua/plenary.nvim" })
end)
