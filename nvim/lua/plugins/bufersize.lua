return {
  "kwkarlwang/bufresize.nvim",
  config = function()
    local opts = { noremap = true, silent = true }

    require("bufresize").setup({
      register = {
        keys = {
          { "n", "<C-w><", "<C-w><", opts },
          { "n", "<C-w>>", "<C-w>>", opts },
          { "n", "<C-w>+", "<C-w>+", opts },
          { "n", "<C-w>-", "<C-w>-", opts },
          { "n", "<C-w>_", "<C-w>_", opts },
          { "n", "<C-w>=", "<C-w>=", opts },
          { "n", "<C-w>|", "<C-w>|", opts },
          { "",  "<LeftRelease>", "<LeftRelease>", opts },
          { "i", "<LeftRelease>", "<LeftRelease><C-o>", opts },
        },
        trigger_events = { "BufWinEnter", "WinEnter" },
      },
      resize = {
        keys = {},
        trigger_events = { "VimResized" },
        increment = false,
      },
    })
  end
}

