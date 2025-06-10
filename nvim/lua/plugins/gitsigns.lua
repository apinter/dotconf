-- Source: https://github.com/burcz/config/blob/lazy/nvim/lua/plugins/gitsigns.lua
return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			numhl = true,
			current_line_blame = true,
		})
	end,
}
