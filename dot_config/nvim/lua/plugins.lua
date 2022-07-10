local function get_config(name)
  return string.format('require("config/%s")', name)
end

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use 'ful1e5/onedark.nvim'

  use({ "nvim-lualine/lualine.nvim", config = get_config("lualine") })

  use({ "rcarriga/nvim-notify", config = get_config("notify") })

  use({ "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree") })

  use({ "glepnir/dashboard-nvim", config = get_config("dashboard") })

  use("kyazdani42/nvim-web-devicons")

  use({ "lukas-reineke/indent-blankline.nvim", config = get_config("indent-blankline") })

  use({ "neovim/nvim-lspconfig", config = get_config("lsp") })
  use({ "williamboman/nvim-lsp-installer", config = get_config("lsp") })

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
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")

  use({ "nvim-treesitter/nvim-treesitter", config = get_config("treesitter") })
  use("p00f/nvim-ts-rainbow")

  use("tpope/vim-commentary")
  use("tpope/vim-surround")

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

  use({ "norcalli/nvim-colorizer.lua", config = get_config("colorizer") })
end)
