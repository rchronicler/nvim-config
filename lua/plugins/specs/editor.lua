return {

  -- Nvim-treesitter ( Treesitter configurations and abstraction layer )
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('editor.treesitter')
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
      and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
      or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require('editor.cmp')
    end
  },

  -- Leap ( Code navigator )
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x" } },
      { "S", mode = { "n", "x" } },
      { "x", mode = { "v" } },
      { "X", mode = { "v" } },
    },
    config = function()
      require('leap').add_default_mappings()
    end
  },

  -- Nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event="InsertEnter",
    config = function() require("nvim-autopairs").setup {} end
  },

  -- Sentiment ( Outer pair highlighter )
  {
    "utilyre/sentiment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    opts = {
    },
  },

  -- Nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "InsertEnter",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    event = "InsertEnter",
    config = function()
      require('Comment').setup()
    end,
  },

  -- Renamer
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require('editor.spectre')
    end
  },

  -- Indent viualizer
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('editor.blankline')
    end,

  },

}
