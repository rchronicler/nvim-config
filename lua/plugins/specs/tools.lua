return {

  -- Neo-tree ( File Explorer )
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>NeoTreeFloatToggle<cr>", desc = "Neo-tree float"},
      { "<leader>v", "<cmd>Neotree toggle<cr>", desc = "Neo-tree toggle"},
    },
  },

  -- Undotree ( Undo visualizer )
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree toggle" },
    },
  },

  -- Telescope ( Finder )
  {
    "nvim-telescope/telescope.nvim", tag = '0.1.1',
    event = "VeryLazy",
    dependencies = { 
      'nvim-lua/plenary.nvim',    
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-frecency.nvim',
      'smartpde/telescope-recent-files',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    keys = {
      {"<leader>ff", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Find file" },
      {"<leader>fr", "<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", desc = "Find recent" },
      {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find word" },
      {"<leader>fk", "<cmd>Telescope keymaps theme=get_dropdown<cr>", desc = "Find keymap" },
      {"<leader>ft", "<cmd>Telescope colorscheme theme=get_dropdown<cr>", desc = "Find colorscheme" },
      {"<leader>fp", "<cmd>lua require'telescope'.extensions.project.project{ display_type = full }<CR>", desc = "Find projects" },
    },
    config = function()
      require('tools.telescope')
    end
  },

  -- Harpoon ( File Navigator )
  {
    "ThePrimeagen/harpoon",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file" },
      { "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "File switcher" },
      { "<leader>j", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Previous file" },
      { "<leader>k", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Next file" },
    },
  },

  -- WhichKey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("tools.whichkey")
    end,
  },

  -- Toggle terminal
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("tools.toggleterm")
    end,
  },

  -- Alpha ( Greeter )
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    config = function()
      require('tools.alpha')
    end
  },

  -- Github Copilot
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    build = ":Copilot auth",
    config = function()
      require("copilot").setup({})     
      -- require("copilot").setup({suggestion = {auto_trigger = true}})
    end,
  },

}
