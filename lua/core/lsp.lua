--language lsp
vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'

-- other config
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    -- obtain lsp client
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- basic keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf, desc = 'Lsp: Goto Definition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'Lsp: Goto Declaration' })

    -- [diagnostics]
    vim.diagnostic.config {
      virtual_text = {
        true,
        prefix = '',
      },
      float = { severity_sort = true, border = "rounded" },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '',
          [vim.diagnostic.severity.INFO] = '',
        }
      }
    }

    -- show diagnostics float window
    vim.keymap.set('n', '<leader>ld', function()
      vim.diagnostic.open_float { source = true }
    end, { buffer = event.buf, desc = 'Lsp: Show Diagnostic' })
    vim.keymap.set('n', '<leader>td', (function()
      local diag_status = 1
      return function()
        if diag_status == 1 then
          diag_status = 0
          vim.diagnostic.config { underline = false, virtual_text = false, signs = false, update_in_insert = false }
        else
          diag_status = 1
          vim.diagnostic.config { underline = true, virtual_text = true, signs = true, update_in_insert = true }
        end
      end
    end)(),
    { buffer = event.buf, desc = 'Lsp: Toggle Diagnostics' }
    )

    -- folding
    if client and client:supports_method 'textDocument/foldingRange' then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end

    -- inlay hint
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, { buffer = event.buf, desc = 'Lsp: Toggle Inlay Hints' })
    end

    -- offloads upon detachment
    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_create_autocmds { 'kickstart-lsp-highlight', buffer = event2.buf }
      end,
    })
  end,
})
