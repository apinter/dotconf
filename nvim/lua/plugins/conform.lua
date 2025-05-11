return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt", lsp_format = "fallback" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          hcl = { "packer_fmt" },
          terraform = { "terraform_fmt" },
          tf = { "terraform_fmt" },
          ["terraform-vars"] = { "terraform_fmt" },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          require("conform").format({
            bufnr = args.buf,
            lsp_fallback = true,
          })
        end,
      })
    end,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        desc = "Format buffer",
      },
    },
  },
}
