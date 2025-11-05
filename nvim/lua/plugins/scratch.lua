return {
	"LintaoAmons/scratch.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "ibhagwan/fzf-lua" },
		{ "nvim-telescope/telescope.nvim" },
		-- { "folke/snacks.nvim" },
		{ "stevearc/dressing.nvim" },
	},
	config = function()
		require("scratch").setup({
			scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim",
			window_cmd = "rightbelow vsplit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
			use_telescope = true,
			file_picker = "fzflua", -- "fzflua" | "telescope" | "snacks" | nil
			filetypes = { "lua", "js", "sh", "ts", "py" }, -- you can simply put filetype here
			filetype_details = {
				json = {},
				["project-name.md"] = {
					subdir = "project-name",
				},
				["yaml"] = {},
				go = {
					requireDir = true,
					filename = "main",
					content = { "package main", "", "func main() {", "  ", "}" },
					cursor = {
						location = { 4, 2 },
						insert_mode = true,
					},
				},
			},
			localKeys = {
				{
					filenameContains = { "sh" },
					LocalKeys = {
						{
							cmd = "<CMD>RunShellCurrentLine<CR>",
							key = "<C-r>",
							modes = { "n", "i", "v" },
						},
					},
				},
			},
			hooks = {
				{
					callback = function()
						vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
					end,
				},
			},
		})
	end,
	event = "VeryLazy",
}
