vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Themes
  use({ "navarasu/onedark.nvim", as = "onedark" })

  -- Plugins
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    requires = {
      { "nvim-lua/plenary.nvim" },
    }
  })
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("numToStr/Comment.nvim")
  use("akinsho/toggleterm.nvim")
  use({
    "ggandor/leap.nvim",
    requires = {
      { "tpope/vim-repeat" }
    }
  })
  use({
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    }
  })
  use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })
  use("stevearc/oil.nvim")
  use("stevearc/conform.nvim")
  use({
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    }
  }
end)
