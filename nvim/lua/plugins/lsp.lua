return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    require("conform").setup({
      formatters_by_ft = {
      }
    })
    local cmp = require('cmp')
    -- local cmp_lsp = require("cmp_nvim_lsp")
    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- local capabilities = vim.tbl_deep_extend(
    --   "force",
    --   {},
    --   vim.lsp.protocol.make_client_capabilities(),
    --   cmp_lsp.default_capabilities())
    local icons = {
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = "󰊕 ",
      Interface = " ",
      Keyword = " ",
      Method = "ƒ ",
      Module = "󰏗 ",
      Property = " ",
      Snippet = " ",
      Struct = " ",
      Text = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    }
    local completion_kinds = vim.lsp.protocol.CompletionItemKind
    for i, kind in ipairs(completion_kinds) do
      completion_kinds[i] = icons[kind] and icons[kind] .. kind or kind
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = true,
      lineFoldingOnly = true,
    }

    capabilities.textDocument.semanticTokens.multilineTokenSupport = true
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- ensure_installed = {
      --   "lua_ls",
      --   "ansiblels",
      --   "bashls",
      --   "markdown_oxide",
      --   "pyright",
      -- },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        zls = function()
          local lspconfig = require("lspconfig")
          lspconfig.zls.setup({
            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
              zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
              },
            },
          })
          vim.g.zig_fmt_parse_errors = 0
          vim.g.zig_fmt_autosave = 0
        end,

        ["bashls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lspconfig.setup({
            cmd = { "bash-language-server", "start" },
            filetypes = { "bash", "sh", "zsh" },
            root_markers = { ".git", vim.uv.cwd() },
            settings = {
              bashIde = {
                globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
              },
            },
          })
        end,

        ["dockerls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.dockerls.setup({
            capabilities = capabilities,
          })
        end,

        ["terraformls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.terraformls.setup({
            capabilities = capabilities,
          })
        end,

        ["tflint"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tflint.setup({
            capabilities = capabilities,
          })
        end,

        ["jsonls"] = function()
          local lspconfig = require("lspconfig")
          local schemastore = require("schemastore")

          lspconfig.jsonls.setup({
            capabilities = capabilities,
            settings = {
              json = {
                format = {
                  enable = true,
                },
                validate = {
                  enable = true,
                },
                schemas = schemastore.json.schemas(),
              },
            },
            on_new_config = function(new_config)
              new_config.settings.json.schemas = new_config.settings.json.schemas or {}
              vim.list_extend(new_config.settings.json.schemas, schemastore.json.schemas())
            end,
          })
        end,

        ["yamlls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.yamlls.setup({
            -- capabilities = capabilities,
            settings = {
              yaml = {
                format = {
                  enable = true,
                },
                schemaStore = {
                  enable = false,
                },
                validate = true,
                completion = true,
                hover = true,
                schemas = {
                  ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.4-standalone-strict/all.json"] =
                  "/**/*.{yml,yaml}",
                  -- Additional
                  ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
                  ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                  ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                  ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] =
                  "roles/tasks/*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] =
                  "*.{yml,yaml}",
                  ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                  ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                  ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                  ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
                  "*gitlab-ci*.{yml,yaml}",
                  ["https://json.schemastore.org/grpc-api-gateway.json"] = "*api*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                  "*docker-compose*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
                  "*flow*.{yml,yaml}",
                },
              },
            },
          })
        end,

        ["pyright"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.pyright.setup {
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "off",
                  autoImportCompletions = true,
                  useLibraryCodeForTypes = true,
                }
              }
            }
          }
        end,

        ["clangd"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.clangd.setup({
            capabilities = capabilities,
          })
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      -- sources = {
      --   default = { "lsp", "path", "snippets", "buffer" },
      -- },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' },
        { name = "path" },
      },
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'λ',
            luasnip = '⋗',
            buffer = 'Ω',
            path = '🖫',
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,

      }
    })
    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,

    })
  end,
}
