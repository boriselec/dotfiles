-- todo search project (.git/..) root
local path = vim.fn.expand('%:p:h')

require("nvim-tree.api").tree.change_root(path)
vim.api.nvim_command('cd ' .. path)
