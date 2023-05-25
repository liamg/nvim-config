local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
 options = {
        diagnostics = "nvim_lsp",
        separator_style = "padded_slant", -- | "thick" | "thin" | { 'any', 'any' },
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
  }
}
