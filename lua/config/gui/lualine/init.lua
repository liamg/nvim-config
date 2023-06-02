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

--local filetype = {
--    "filetype",
--    icons_enabled = true,
--   color = subtle,
--}

local location = {
    "location",
    padding = { right = 1 },
}

local filename = {
  'filename',
  path = 1,
  color = subtle,
}

--local encoding = {
--  'encoding',
--  color = subtle,
--}

local function project()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end


local songline = ""

local function song()
  return songline
end

local function updateSong()
  local cmd = "spt playback --status --format '%s %t by %a'"
  local function onspt(_, data)
    if data then
      songline = data[1]
    end
  end
  vim.fn.jobstart(cmd, { on_stdout = onspt, stdout_buffered = true })
end

local timer = vim.loop.new_timer()
timer:start(1000, 10000, vim.schedule_wrap(updateSong))


lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard"}, -- "NvimTree" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { project, filename, diagnostics, diff }, --filetype, encoding
        lualine_x = { song },
        lualine_y = { location },
        lualine_z = { "progress" },
    },
}
