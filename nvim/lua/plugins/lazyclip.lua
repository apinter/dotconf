return {
	"atiladefreitas/lazyclip",
	config = function()
		require("lazyclip").setup({
			-- your custom config here (optional)
		})
	end,
	keys = {
		{ "Cw", desc = "Open Clipboard Manager" },
	},
	-- Optional: Load plugin when yanking text
	event = { "TextYankPost" },
}
