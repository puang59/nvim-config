local M = {}

M.options = {
  nvchad_branch = "v2.0",
}

M.ui = {

  hl_override ={
    NvDashAscii = {
      bg ="none",
      fg ="blue"
    },
    NvDashButtons ={
      bg ="none",
      fg ="light_grey"
    }
  },

  ------------------------------- base46 -------------------------------------
  -- hl = highlights
  hl_add = {},
  changed_themes = {},
  theme = "rosepine",

  transparency = true,
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "vscode", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = false,
    lazyload = true,
    overriden_modules = nil,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
      "puang59"
    },
    -- header = {
    --   "           ▄ ▄                   ",
    --   "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
    --   "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
    --   "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
    --   "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
    --   "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
    --   "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
    --   "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
    --   "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    -- },
    --
    -- buttons = {
    --   { "  Find File", "Spc f f", "Telescope find_files" },
    --   { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
    --   { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    --   { "  Bookmarks", "Spc m a", "Telescope marks" },
    --   { "  Themes", "Spc t h", "Telescope themes" },
    --   { "  Mappings", "Spc c h", "NvCheatsheet" },
    -- },

    buttons = {
      { "Spc f f", " Telescope find_files" },
      { "Spc f w", " Telescope live_grep" },
      { "Spc t h", " Telescope themes" },
      { "Spc c h", " NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "simple" }, -- simple/grid

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = "core.custom.plugins" -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = require "core.mappings"

return M
