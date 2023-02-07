--vim.cmd('let g:onedark_config = {\'style\': \'darker\'}')
--vim.cmd('colorscheme onedark')
--vim.cmd('colorscheme dracula')
--vim.cmd('colorscheme material')
--vim.cmd('colorscheme tokyonight')
vim.cmd('colorscheme codedark')
vim.cmd('let NERDTreeShowHidden = 1')

vim.cmd('syntax on')
vim.cmd('set autochdir')
vim.cmd('set clipboard+=unnamedplus')			-- allows neovim to access the system clipboard (+) is To ALWAYS use the clipboard for ALL operations
-- omnifunc built-in completion 
-- completion <C-p> unintelligent or <C-x><C-o>
vim.cmd('set completeopt=menu,menuone,preview,noselect,noinsert')
vim.cmd('set wildmode=longest,list')			-- get bash-like tab completions
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.backup = false                          -- creates a backup file
vim.opt.swapfile = false						-- creates a swapfile
--vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.pumheight = 10                          -- pop up menu height
--tabulation
vim.cmd('set shiftwidth=4')						-- width for autoindents
--vim.cmd('set autoindent')						-- indent a new line the same amount as the line just typed
vim.cmd('set tabstop=4')						-- number of columns occupied by a tab
vim.cmd('set softtabstop=4')					-- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.cursorline = true
--vim.opt.showtabline = 0                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
--vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 4                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 4                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.cmd('set nocompatible')
vim.cmd('set number')
