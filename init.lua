
local function init(mod)
    require("user."..mod)
end

init "startup"      -- For launching vim - currently used for impatient for speediness
init "options"      -- Set global vim options
init "keymaps"      -- Configure keymaps
init "plugins"      -- Load plugins
init "autocommands" -- Auto-commands
init "colourscheme" -- Colour scheme
init "cmp"          -- Completion
init "telescope"    -- Telescope
init "gitsigns"     -- Git gutter signs
init "treesitter"   -- Code parsing/analysis
init "autopairs"    -- Auto-pairs - close brackets etc.
init "comment"      -- Commenting
init "nvim-tree"    -- Project tree view
init "bufferline"   -- List open buffers
init "lualine"      -- Status line
init "toggleterm"   -- Terminals
init "project"      -- Project management
init "illuminate"   -- Highlight current word
init "indentline"   -- Indents, whitespace and scopes
init "alpha"        -- Greeter
init "lsp"          -- Language servers
init "dap"          -- Debugging (Debug Adapter Protocol)

