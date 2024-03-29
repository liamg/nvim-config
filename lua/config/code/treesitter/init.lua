
-- See https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

local configs_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_ok then
    return
end

configs.setup {
    -- put the language you want in this array
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "go", "terraform" },
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" }, -- List of parsers to ignore installing
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = false, disable = { "python", "css" } },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
