require("config.lazy")
require("plugins.harpoon")
require('lualine').setup()

vim.wo.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = false

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.updatetime = 40

-- remaps
vim.g.mapleader = " "
vim.opt.conceallevel = 1
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>L", ":Lazy<Return>")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "tn", ":tabnew ", { noremap = true, silent = false })
vim.keymap.set("n", "tk", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tj", ":tabprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "th", ":tabfirst<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tl", ":tablast<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
