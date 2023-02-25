
-- See https://github.com/goolord/alpha-nvim

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local content = {
    [[  .S_sSSs      sSSs    sSSs_sSSs     .S    S.    .S   .S_SsS_S.  ]],
    [[ .SS~YS%%b    d%%SP   d%%SP~YS%%b   .SS    SS.  .SS  .SS~S*S~SS. ]],
    [[ S%S   `S%b  d%S'    d%S'     `S%b  S%S    S%S  S%S  S%S `Y' S%S ]],
    [[ S%S    S%S  S%S     S%S       S%S  S%S    S%S  S%S  S%S     S%S ]],
    [[ S%S    S&S  S&S     S&S       S&S  S&S    S%S  S&S  S%S     S%S ]],
    [[ S&S    S&S  S&S_Ss  S&S       S&S  S&S    S&S  S&S  S&S     S&S ]],
    [[ S&S    S&S  S&S~SP  S&S       S&S  S&S    S&S  S&S  S&S     S&S ]],
    [[ S&S    S&S  S&S     S&S       S&S  S&S    S&S  S&S  S&S     S&S ]],
    [[ S*S    S*S  S*b     S*b       d*S  S*b    S*S  S*S  S*S     S*S ]],
    [[ S*S    S*S  S*S.    S*S.     .S*S  S*S.   S*S  S*S  S*S     S*S ]],
    [[ S*S    S*S   SSSbs   SSSbs_sdSSS    SSSbs_S*S  S*S  S*S     S*S ]],
    [[ S*S    SSS    YSSP    YSSP~YSSY      YSSP~SSS  S*S  SSS     S*S ]],
    [[ SP                                             SP           SP  ]],
    [[ Y                                              Y            Y   ]],
}

local dashboard = require "alpha.themes.dashboard"
 dashboard.section.header.val = content

dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
    return ""
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
