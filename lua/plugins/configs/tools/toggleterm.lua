require("toggleterm").setup()

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })
local FloatTerm = Terminal:new({hidden = true, direction = 'float'})

function _lazygit_toggle()
  lazygit:toggle()
end

function _ft_toggle()
  FloatTerm:toggle()
end

vim.keymap.set("n", "<leader>gt", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Lazygit" })
vim.keymap.set("n", "<leader>tf", "<cmd>lua _ft_toggle()<CR>", {noremap = true, silent = true, desc = "Floating terminal" })
vim.keymap.set("n", "<leader>\\", "<cmd>ToggleTerm direction=tab<CR>", {noremap = true, silent = true, desc = "Terminal in new tab" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

