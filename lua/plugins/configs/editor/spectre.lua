vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open({is_insert_mode = true})<CR>', {
    desc = "Open Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({is_insert_mode = true})<CR>', {
    desc = "Search on current file"
})
vim.keymap.set('n', '<leader>sl', '<cmd>lua require("spectre.actions").run_current_replace()<CR>', {
    desc = "Replace current line"
})
vim.keymap.set('n', '<leader>sr', '<cmd>lua require("spectre.actions").run_replace()<CR>', {
    desc = "Replace all"
})
