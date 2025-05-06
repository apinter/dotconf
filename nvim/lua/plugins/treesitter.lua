return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {  "c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"typescript",
				"bash",
				"python",
        "markdown",
        "markdown_inline",
        "markdown_inline",
        "latex",
        "jsdoc",
        "json",
        "jsonc",
        "diff",
        "regex",
        "toml",
        "tsx",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "terraform",
				"heex",
        "javascript",
        "nix",
				"html"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        keymaps = {
          init_selection = "<C-n>",
          node_incremental = "<C-n>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-m>",
        }

        })
    end
}
