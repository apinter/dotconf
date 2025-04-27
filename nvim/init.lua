require("config.lazy")
require("plugins.harpoon")
require('lualine').setup()

vim.wo.number = true
vim.opt.mouse = ""
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

vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged", "FocusLost"}, {
  pattern = "*",
  command = "silent! write",
  nested = true
})

vim.opt.updatetime = 40

vim.g.mapleader = " "
vim.opt.conceallevel = 1
local builtin = require("telescope.builtin")

-- remaps
vim.keymap.set("n", "<leader>L", ":Lazy<Return>")

vim.keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>T", ":terminal<CR>", { noremap = true, silent = true })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bN", ":bNext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "tn", ":tabnew<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "tk", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tj", ":tabprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "th", ":tabfirst<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tl", ":tablast<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<CR>', { desc = 'Open Obsidian note' })
vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>', { desc = 'Create new Obsidian note' })
vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>', { desc = 'Search Obsidian vault' })
vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>', { desc = 'View backlinks' })
vim.keymap.set('n', '<leader>ot', ':ObsidianToday<CR>', { desc = 'Open today’s daily note' })
vim.keymap.set('n', '<leader>oy', ':ObsidianYesterday<CR>', { desc = 'Open yesterday’s daily note' })
vim.keymap.set('n', '<leader>otm', ':ObsidianTemplate<CR>', { desc = 'Insert template' })
vim.keymap.set('n', '<leader>oft', ':ObsidianNewFromTemplate<CR>', { desc = 'Create new note from template' })
vim.keymap.set('n', '<leader>ol', ':ObsidianLink<CR>', { desc = 'Link to existing note' })
vim.keymap.set('n', '<leader>oln', ':ObsidianLinkNew<CR>', { desc = 'Link to new note' })
vim.keymap.set('n', '<leader>of', ':ObsidianFollowLink<CR>', { desc = 'Follow link under cursor' })
vim.keymap.set('n', '<leader>oq', ':ObsidianQuickSwitch<CR>', { desc = 'Quick switch between notes' })
vim.keymap.set('n', '<leader>oi', ':ObsidianOpenInObsidian<CR>', { desc = 'Open note in Obsidian app' })
vim.keymap.set('n', '<leader>oh', ':ObsidianCheckHealth<CR>', { desc = 'Check plugin health' })

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
