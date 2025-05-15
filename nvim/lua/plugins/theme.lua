return {
  -- 'projekt0n/github-nvim-theme',
  -- name = 'github-theme',
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   require('github-theme').setup({
  --   })
  --
  --   vim.cmd('colorscheme github_dark')
  -- end,

  -- "shaunsingh/nord.nvim",
  -- config = function ()
  --    vim.cmd("colorscheme nord")
  -- end

  -- "yazeed1s/minimal.nvim",
  -- config = function()
  --   vim.g.minimal_italic_functions = false
  --   vim.g.minimal_italic_comments = true
  --   vim.cmd("colorscheme minimal-base16")
  -- end,
  "ramojus/mellifluous.nvim",
  -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
  config = function()
    require("mellifluous").setup({})   -- optional, see configuration section.
    vim.cmd("colorscheme mellifluous")
    vim.cmd("Mellifluous kanagawa_dragon")
  end
}
