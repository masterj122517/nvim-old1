vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

vim.keymap.set("n","Q",[[:q<CR>]])
vim.keymap.set("n","<C-s>",[[:w<CR>]])


local opts = { noremap = true, silent = true }

--local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)


vim.cmd "noremap <LEADER><CR> :nohlsearch<CR>"

vim.keymap.set('n', 'sl', ':set splitright<CR>:vsplit<CR>', opts) vim.keymap.set('n', 'sh', ':set nosplitright<CR>:vsplit<CR>', opts)
vim.keymap.set('n', 'sk', ':set nosplitbelow<CR>:split<CR>', opts)
vim.keymap.set('n', 'sj', ':set splitbelow<CR>:split<CR>', opts)
--Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Do not yank with x
vim.keymap.set('n', 'x', '"_x')
--increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

vim.keymap.set('n', 'te', ':tabedit<CR>', opts)
vim.keymap.set('n','th',':-tabnext<CR>',opts)
vim.keymap.set('n','tl',':+tabnext<CR>',opts)
vim.keymap.set('n','tmh',':-tabmove<CR>',opts)
vim.keymap.set('n','tml',':+tabmove<CR>',opts)



vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--suda
vim.cmd[[cnoreabbrev sudowrite w suda://%]]
vim.cmd[[cnoreabbrev sw w suda://%]]

keymap("i", "<C-v>", "<cmd>Telescope registers<cr>", opts)

vim.keymap.set("n",";",":")
vim.cmd[[noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>"_c4l]]
--
--Spelling Check with <space>sc
vim.cmd[[noremap <LEADER>sc :set spell!<CR>]]

