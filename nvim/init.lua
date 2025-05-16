require("config.options")
require("config.key-binding")

vim.o.filetype = "off"
require("config.lazy")
vim.cmd('filetype plugin indent on')

require("config.workspace-bootstrap")
