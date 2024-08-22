-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-----------------
-- Normal mode --
-----------------

-- Tabs
vim.keymap.set("n", "<C-n>", ":tabnew<CR>")
vim.keymap.set("n", "<leader>T", ":tabnext<CR>")
vim.keymap.set("n", "<C-w>", ":tabclose<CR>")

-- LSP
vim.keymap.set("n", "<leader>gd", ":Telescope lsp_definition<CR>", { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "<leader>gr", ":Telescope lsp_references<CR>", { desc = "[G]oto [R]eference" })
vim.keymap.set("n", "<leader>gI", ":Telescope lsp_implementations<CR>", { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>D", ":Telescope lsp_type_definitions<CR>", { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>ds", ":Telescope lsp_documents_symbols<CR>", { desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>ws", ":Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "[W]orkspace [S]ymbols" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]efinition" })

-- Save
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- File explorer
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>te", ":Neotree toggle<CR>")

-- Transparency Babyyyyy
vim.keymap.set("n", "<leader>et", ":TransparentToggle<CR>")
vim.keymap.set("n", "<leader>ec", ":Telescope colorscheme<CR>")

-- Remove arrow keys
vim.keymap.set("n", "<up>", "<cr>")
vim.keymap.set("n", "<down>", "<cr>")
vim.keymap.set("n", "<left>", "<cr>")
vim.keymap.set("n", "<right>", "<cr>")

-- Toggle Term
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=75 <cr>")
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<C-t>", ":ToggleTerm<cr>")

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-----------------
--  Term mode  --
-----------------
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
