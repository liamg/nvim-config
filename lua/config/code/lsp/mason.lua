local servers = {
    "cssls",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "gopls",
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})


local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end


local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = Req("handlers").on_attach,
        capabilities = Req("handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local ok, conf_opts =pcall(require, _BASE_PACKAGE:match("(.*)[.]")..".settings." .. server)
    if ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end
