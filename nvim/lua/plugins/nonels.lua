return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      null_ls.builtins.formatting.packer,
      null_ls.builtins.formatting.terraform_fmt,
      null_ls.builtins.diagnostics.terraform_validate,
    })
  end,
}
