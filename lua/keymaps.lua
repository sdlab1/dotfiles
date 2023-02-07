-- Shorten function name
local map = vim.api.nvim_set_keymap
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Modes
-- empty for :map (normal / visual / operator) https://neovim.io/doc/user/map.html#mapmode-nvo
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

map("n", "<c-t>", ":tabnew<CR>:NERDTreeMirror<CR>:NERDTreeFocus<CR>")
map("n", "<c-w>", ":tabclose<CR>")
map("n", "<c-o>", ":NERDTreeToggle<CR>")
-- save session and quit
map("n", "<c-q>", ":mks! $HOME/recent.vim<CR>:qa<CR>")
map("i", "<c-q>", "<Esc>:mks! $HOME/recent.vim<CR>:qa<CR>")
-- save
map("n", "<c-s>", ":w!<CR>")
map("i", "<c-s>", "<Esc>:w!<CR>a")
-- backup file to bak dir
map("", "<Leader>`", ":exe 'w! %:h/bak/%_' . strftime('%d-%m-%Y') . '.bak'<CR>")
-- move screen up
map("n", "<c-Up>", "<c-y>")
map("i", "<c-Up>", "<c-y>")
-- move screen down
map("n", "<c-Down>", "<c-e>")
map("i", "<c-Down>", "<c-e>")
-- reload init.vim
map("n", "<Leader>r", ":source $MYVIMRC<CR>")
map("n", "<c-a>", "<cmd>AerialToggle!<CR>")
map("i", "<c-a>", "<cmd>AerialToggle!<CR>")
-- list lsp symbols
map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
-- CTRL-Z is Undo; CTRL-Y is Redo (although not repeat)
map("n", "<c-z>", "u")
map("i", "<c-z>", "<c-O>u")
map("n", "<c-y>", "<c-R>")
map("i", "<c-y>", "<c-O><c-R>")
--  CTRL-X and SHIFT-Del are Cut
map("v", "<c-x>", "\"+x")
map("v", "<S-Del>", "\"+x")
-- CTRL-C and CTRL-Insert are Copy
map("v", "<c-c>", "\"+y")
map("v", "<c-Insert>", "\"+y")
-- CTRL-V and SHIFT-Insert are Paste
map("n", "<c-v>", "\"+gP")
map("n", "<S-Insert>", "\"+gP")
map("c", "<c-v>", "<c-R>+")
map("c", "<S-Insert>", "<c-R>+")
--map("i", "<c-v>", "<Esc>l\"+gPi")
map("i", "<c-v>", "<C-R>+")
return
