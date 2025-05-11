-- Managing LSP servers
-- :Mason to install update etc.
return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local mason_tool_installer = require('mason-tool-installer')

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      pip = {
        upgrade_pip = true, -- Update pip when managing Python packages
      }
    })

    mason_lspconfig.setup({
      -- LSP servers to install automatically
      ensure_installed = {
        'ansiblels',
        'lua_ls',
        'html',
        'cssls',
        'pylsp',
        'bashls',
        'clangd',
        'docker_compose_language_service',
        'yamlls',
        'pyright',
        'zls',
        'jsonls'
      },
    })

    mason_tool_installer.setup({
      -- Non-LSP tools to install automatically
      ensure_installed = {
        'prettier',
        'isort',
        'black',
        'kube-linter',
        'terraform-ls',
        'tflint',
      }
    })
  end,
}
