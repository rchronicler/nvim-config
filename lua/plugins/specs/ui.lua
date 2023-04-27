return {

  -- Catpuccin ( colorscheme )
  { "catppuccin/nvim", name = "catppuccin" },

  -- Tokyonight ( colorscheme )
  { "folke/tokyonight.nvim", name = "tokyonight" },

  -- Dressing ( UI Refinement )
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- Noicer UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('ui.noice')
    end,
  },

}
