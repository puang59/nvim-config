-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local null_ls = require("null-ls")
--
-- local opts = {
--   sources = {
--     null_ls.builtins.diagnostics.eslint,
--     null_ls.builtins.formatting.prettier,
--   },
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({
--         group = augroup,
--         buffer = bufnr,
--       })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = bufnr })
--         end,
--       })
--     end
--   end,
-- }
--
-- return opts
--

--
-- local null_ls = require("null-ls")
--
-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"nul
-- local async = event == "BufWritePost"
--
-- null_ls.setup({
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.keymap.set("n", "<Leader>f", function()
--         vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--       end, { buffer = bufnr, desc = "[lsp] format" })
--
--       -- format on save
--       vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
--       vim.api.nvim_create_autocmd(event, {
--         buffer = bufnr,
--         group = group,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = bufnr, async = async })
--         end,
--         desc = "[lsp] format on save",
--       })
--     end
--
--     if client.supports_method("textDocument/rangeFormatting") then
--       vim.keymap.set("x", "<Leader>f", function()
--         vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--       end, { buffer = bufnr, desc = "[lsp] format" })
--     end
--   end,
-- })
--


-- ## WORKING CODE FOR SPACE FM FORMATTING ##

-- local null_ls = require("null-ls")
--
-- local opts = {
--     sources = {
--         null_ls.builtins.formatting.clang_format,
--     }
-- }
--
-- null_ls.setup(opts)
--
-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"
--
-- local function lsp_format(bufnr)
--     vim.lsp.buf.format({ bufnr = bufnr, async = async })
-- end
--
-- vim.api.nvim_exec([[
--   augroup lsp_format_on_save
--     autocmd!
--     autocmd BufWritePre * lua require('null-ls').save()
--     autocmd BufWritePre * lua require('null-ls').run()
--   augroup END
-- ]], true)
--
-- vim.keymap.set("n", "<Leader>f", function()
--     lsp_format(vim.api.nvim_get_current_buf())
-- end, { buffer = true, desc = "[lsp] format" })
--
-- vim.keymap.set("x", "<Leader>f", function()
--     lsp_format(vim.api.nvim_get_current_buf())
-- end, { buffer = true, desc = "[lsp] format" })
--

--
local null_ls = require("null-ls")

-- Create a new augroup for the LspFormatting
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Setup the null-ls options
local opts = {
    sources = {
        null_ls.builtins.formatting.clang_format,
    },
    -- on_attach = function(client, bufnr)
    --     -- Check if the client supports textDocument/formatting
    --     if client.supports_method("textDocument/formatting") then
    --         -- Define the callback function to format on save
    --         local format_on_save = function()
    --             vim.lsp.buf.format({ bufnr = bufnr, async = true })
    --         end
    --
    --         -- Map the format_on_save function to BufWritePre event
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = format_on_save,
    --             desc = "[lsp] format on save",
    --         })
    --     end
    -- end,
}

-- Return the options
return opts

