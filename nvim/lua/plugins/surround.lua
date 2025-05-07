return (
  {
  "echasnovski/mini.surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("mini.surround").setup({
      -- Use default mappings (can be customized)
      mappings = {
        add = 'sa',            -- Add surrounding
        delete = 'sd',         -- Delete surrounding
        replace = 'sr',        -- Replace surrounding
        find = 'sf',           -- Find surrounding (to the right)
        find_left = 'sF',      -- Find surrounding (to the left)
        highlight = 'sh',      -- Highlight surrounding
        update_n_lines = 'sn', -- Update `n_lines`
      },
    })
  end,
}
)
