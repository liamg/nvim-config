local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    always_visible = false,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local subtle = {
  fg = "#5c6370",
}

local filetype = {
    "filetype",
    icons_enabled = true,
    color = subtle,
}

local location = {
    "location",
    padding = { right = 1 },
}

local filename = {
  'filename',
  path = 1,
  color = subtle,
}

local encoding = {
  'encoding',
  color = subtle,
}

lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { diagnostics, filename },
        lualine_x = { diff, encoding, filetype },
        lualine_y = { location },
        lualine_z = { "progress" },
    },
}
