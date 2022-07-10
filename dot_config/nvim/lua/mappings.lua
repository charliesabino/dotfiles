local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

map("n", "<leader>fo", ":set guifont=Monaco:h18<CR>", opts)

map("n", "H", ":BufferLineCyclePrev<CR>", opts)
map("n", "L", ":BufferLineCycleNext<CR>", opts)

map("n", "<leader>q", ":Bdelete<CR>", opts)

map("n", "<leader>fp", ":lua vim.lsp.buf.formatting()<CR>", opts)

map("v", "p", '"_dP', opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

