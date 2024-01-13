local on_attach = function(_, bufnr)
    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, {buffer = bufnr})
    end

    bufmap('<leader>r', vim.lsp.buf.rename)
    -- bufmap('<leader>a', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('<leader>D', vim.lsp.buf.type_definition)

    -- bufmap('gr', require('telescope.builtin').lsp_references)
    -- bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    -- bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    --
    bufmap('K', vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format',
                                         function(_) vim.lsp.buf.format() end,
                                         {})
end

require('neodev').setup({
    override = function(root_dir, library)
        if root_dir:find("/home/luca/nixOS", 1, true) == 1 then
            library.enabled = true
            library.plugins = true
        end
    end
})

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    Lua = {
        diagnostics = {globals = {'s', 't', 'i', 'fmt', 'fmta'}},
        workspace = {checkThirdParty = false},
        telemetry = {enable = false}
    }
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"}
})

lspconfig.ltex.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"tex"}
})

lspconfig.texlab.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"tex"}
})

-- lspconfig.util.setup()
-- lspconfig.nil.setup({
-- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"nix"},
--  })
