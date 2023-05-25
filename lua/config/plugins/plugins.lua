-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Packer is not yet running - please restart Neovim...")
    return
end

-- Have packer use a popup window
packer.init {
    max_jobs = 5,
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use { "wbthomason/packer.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "windwp/nvim-autopairs" }
    use { "numToStr/Comment.nvim" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "nvim-tree/nvim-web-devicons" }
    use { "nvim-tree/nvim-tree.lua" }
    use { "akinsho/bufferline.nvim" }
    use { "moll/vim-bbye" }
    use { "nvim-lualine/lualine.nvim" }
    use { "akinsho/toggleterm.nvim" }
    use { "lewis6991/impatient.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "goolord/alpha-nvim" }

    -- Colorschemes
    use { "folke/tokyonight.nvim" }
    use { "lunarvim/darkplus.nvim" }
    use { "nyoom-engineering/oxocarbon.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rmehri01/onenord.nvim" }
    use { "projekt0n/github-nvim-theme" }

    -- cmp plugins
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }

    -- snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }

    -- LSP
    -- use { "williamboman/nvim-lsp-installer" }
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "RRethy/vim-illuminate" }
    use { "ray-x/lsp_signature.nvim" }
    use { "simrat39/inlay-hints.nvim" }

    -- Telescope
    use { "nvim-telescope/telescope.nvim" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }
    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      requires = "nvim-treesitter/nvim-treesitter",
    })

    -- Git
    use { "lewis6991/gitsigns.nvim" }

    -- DAP
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui" }
    use { "ravenxrz/DAPInstall.nvim" }
    use { "leoluz/nvim-dap-go" }

    -- copilot
    use { "github/copilot.vim" }

    -- trouble
    use { "folke/trouble.nvim" }

    -- go
    use { "ray-x/go.nvim" }
    use { "ray-x/guihua.lua" }

    -- key hints
    use { "folke/which-key.nvim" }

    -- sessions
    --use { "rmagatti/auto-session" }
    --use { "rmagatti/session-lens" }
    use { "Shatur/neovim-session-manager" }

    use {
      "SmiteshP/nvim-navbuddy",
      requires = {
          "neovim/nvim-lspconfig",
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
      }
    }
    use { "utilyre/barbecue.nvim" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
