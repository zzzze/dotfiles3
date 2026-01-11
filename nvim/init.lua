require("config.options")

vim.o.filetype = "off"
require("config.lazy")
vim.cmd('filetype plugin indent on')

require("config.options-overlay")
require("config.key-binding")

require("config.workspace-bootstrap")
