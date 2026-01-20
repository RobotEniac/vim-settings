-- In your init.lua
-- This assumes rust-analyzer is in your PATH

vim.lsp.config.rust_analyzer = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
  settings = {
    ['rust-analyzer'] = {
      check = { command = 'clippy' },
      -- ... other settings ...
    },
  },
  -- Define your on_attach function here if needed
  on_attach = function(client, bufnr)
    -- Keymaps and capabilities setup
  end,
}

-- Enable the configuration when Neovim starts
vim.lsp.enable({ 'rust_analyzer' })

