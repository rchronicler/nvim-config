local whichkey = require "which-key"

local conf = {
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
}

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  ["W"] = { "<cmd>update!<CR>", "Save" },

  b = {
    name = "Buffer",
    c = { "<Cmd>bd!<Cr>", "Close current buffer" },
    D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
  },

  f = {
    name = "Find/Files"
  },

  s = {
    name = "Search"
  },

  g = {
    name = "Git",
  },
}

whichkey.setup(conf)
whichkey.register(mappings, opts)
