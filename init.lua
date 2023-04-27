-- To get all the .lua in lua/plugins/configs/
local config = vim.fn.stdpath("config")
package.path = config .. "/lua/plugins/configs/?.lua;" .. config .. "/lua/plugins/configs/?/init.lua;" .. package.path

require("plugins")
require("core")

vim.cmd[[colorscheme catppuccin]]
