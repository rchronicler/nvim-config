local alpha = require'alpha'
local theme = require("alpha.themes.theta")
local dashboard = require'alpha.themes.dashboard'

-- Header
local header = {
    type = "text",
    val = {
        [[                                  __]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    },
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
    },
}

-- Buttons
local links = {
  type = "group",
  val = {
    { type = "text", val = "Quick Links", opts = { hl = "SpecialComment", position = "center" } },
    { type = "padding", val = 1 },
    dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", " " .. " Config", "<CMD>execute 'cd ' . fnamemodify($MYVIMRC, ':h')<CR> || <CMD>e $MYVIMRC<CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  },
  position = "center",
}

-- Recent files
local function get_mru(max_shown)
  local tbl = {
    { type = "text", val = "Recent Files", opts = { hl = "SpecialComment", position = "center" } },
    { type = "padding", val = 1 },
  }

  local mru_list = theme.mru(1, "", max_shown)
  for _, file in ipairs(mru_list.val) do
    table.insert(tbl, file)
  end

  return { type = "group", val = tbl, opts = {} }
end

-- Info
local get_info = {
    type = "text",
    val = {

    },
    opts = {
        position = "center",
        hl = "Type",
    },
}

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local lazy_stats = require("lazy").stats()
    local ms = (math.floor(lazy_stats.startuptime * 100 + 0.5) / 100)
    local total_plugins = " " .. lazy_stats.loaded .. "/" .. lazy_stats.count .. " packages in " .. ms .. " ms"

    local datetime = os.date(" %A %B %d")

    local version = vim.version()
    local nvim_version_info = "ⓥ  " .. version.major .. "." .. version.minor .. "." .. version.patch

    local info_string = datetime .. "  |  " .. total_plugins .. "  |  " .. nvim_version_info
    get_info.val = info_string
    pcall(vim.cmd.AlphaRedraw)
  end,
})

theme.config.layout = {
  { type = "padding", val = 1 },
		header,  
  { type = "padding", val = 1 },
    get_info,
  { type = "padding", val = 2 },
		links,  
  { type = "padding", val = 2 },
    get_mru(5),
}

if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      require("lazy").show()
    end,
  })
end

alpha.setup(theme.config)
