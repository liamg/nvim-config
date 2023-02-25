
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

req "mason"
req("handlers").setup()
req "null-ls"
req "trouble" -- diagnostics display
