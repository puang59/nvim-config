local g = vim.g
require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

if g.neovide then
  g.neovide_transparency = 0.8
  g.neovide_refresh_rate = 144
  -- g.neovide_cursor_vfx_mode = 'ripple'
  g.neovide_cursor_animation_length = 0.3
  g.neovide_cursor_trail_size = 0.2
  g.neovide_remember_window_size = true
  g.neovide_remember_window_position = true
end
require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
