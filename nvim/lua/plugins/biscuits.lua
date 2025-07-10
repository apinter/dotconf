return {
	{
		"code-biscuits/nvim-biscuits",
		config = function()
			require("nvim-biscuits").setup({
				cursor_line_only = true,
				show_on_start = true,
				default_config = {
					max_length = 25,
					min_distance = 5,
					prefix_string = " 📎 ",
				},
				language_config = {
					html = {
						prefix_string = " 🌐 ",
					},
					javascript = {
						prefix_string = " ✨ ",
						max_length = 80,
					},
					python = {
						prefix_string = " 🐍 ",
						max_length = 50,
					},
				},
			})
		end,

		-- keys = {
		-- 	{
		-- 		"<leader>bb",
		-- 		function()
		-- 			require("nvim-biscuits").BufferAttach()
		-- 		end,
		-- 		mode = "n",
		-- 		desc = "Enable Biscuits",
		-- 	},
		-- },
	},
}
