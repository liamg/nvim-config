
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

Req "mason"
Req("handlers").setup()
Req "null-ls"
Req "trouble" -- diagnostics display
Req "signatures" -- show popup method signatures as you type
Req "inlays"
