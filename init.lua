--vim.cmd('let g:node_host_prog = \'/home/admin/.config/nvm/versions/node/v19.4.0/bin/node\'')
--vim.g.node_host_prog = '/home/admin/.config/nvm/versions/node/v19.4.0/bin/node'
--vim.g.node_host_prog = "/home/admin/node-v18.13.0-linux-x64/bin/node"
--vim.cmd('let g:node_host_prog = \'/home/admin/node-v18.13.0-linux-x64/bin/node\'')
vim.cmd("let $PATH = '/home/admin/node-v18.13.0-linux-x64/bin:' . $PATH")
require('plugins')
require('keymaps')
require('options')
require('cmp-setup')
require('statusline')
-- Remove any disabled or unused plugins
--:PackerClean
-- Clean, then install missing plugins
--:PackerInstall
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
--:PackerCompile
-- Show list of installed plugins
--:PackerStatus
