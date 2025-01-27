local cmd = vim.cmd
-- local g = vim.g
local o = vim.o

require("remap")
require("set")
-- pluginlist
require("Comment").setup()
require("gitsigns").setup()

-- local path =
-- options
-- vim.opt.number = true

o.clipboard = 'unnamedplus'

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.o.tabstop = 2
--

-- cmd('filetype plugin indent on')
-- cmd('syntax enable')
--
--
-- -- PDF Viewer:
-- -- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
-- vim.g['vimtex_view_method'] = 'zathura'
-- -- vim.g['vimtex_quickfix_mode'] = 0
-- --
-- -- -- Ignore mappings
-- -- vim.g['vimtex_mappings_enabled'] = 0
--
-- -- Auto Indent
-- vim.g['vimtex_indent_enabled'] = 1
--
-- -- Syntax highlighting
-- vim.g['vimtex_syntax_enabled'] = 1
--
-- -- Error suppression:
-- -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt
--
-- -- vim.g['vimtex_log_ignore'] = ({
-- --     'Underfull', 'Overfull', 'specifier changed to',
-- --     'Token not allowed in a PDF string'
-- -- })
--
-- -- vim.g['vimtex_context_pdf_viewer'] = 'okular'
--
-- -- vim.g['vimtex_compiler_progname'] = 'tectonic'
-- vim.g['vimtex_compiler_methode'] = 'tectonic'
-- vim.g['tex_flavor'] = 'latex'
-- -- vim.g['vimtex_complete_close_braces'] = 1
-- -- vim.g['vimtex_complete_enabled'] = 1
--
-- -- require('cmp_vimtex').setup({
-- --     additional_information = {
-- --         info_in_menu = true,
-- --         info_in_window = true,
-- --         info_max_length = 60,
-- --         match_against_info = true,
-- --         symbols_in_menu = true
-- --     },
-- --     bibtex_parser = {enabled = true}
-- -- })
