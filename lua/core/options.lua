local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- General
o.updatetime = 250            -- Interval for writing swap file to disk, also used by gitsigns
o.undofile = true             -- Enable saving the editing history into a file
o.undodir = os.getenv("HOME") .. "/.nvim/undodir"     -- Specify the directory to save the history files

-- Behaviour
o.splitright = true           -- Splits open on the right.
o.splitbelow = true           -- Splits open on the bottom.
 --o.lazyredraw = true           -- faster scrolling.

-- Indenting
o.shiftwidth = 4              -- When shifting, indent using four spaces.
o.tabstop = 4                 -- Number of columns occupied by a tab.
o.softtabstop = 4             -- see multiple spaces as tabstops so <BS>.
o.expandtab = true            -- Convert tabs to spaces.
o.smartindent = true          -- Smart Indent

-- Search
o.ignorecase = true           -- Ignore case when searching.
o.smartcase = true            -- Automatically switch search to case-sensitive when search query contains an uppercase letter.
o.hlsearch = true             -- Enable search highlighting.

-- UI
o.termguicolors = true        -- Enable (24-bit) colours.
o.scrolloff = 5               -- determines the number of context lines you would like to see above and below the cursor.
o.sidescrolloff = 3           -- Scroll off to the side.
o.number = true               -- Enable line numbers.
o.wrap = false                -- Display long lines as just one line.
o.clipboard = 'unnamedplus'   -- Use system clipboard.
o.cursorline = true           -- Highlight the current line

-- Jump to the last position when reopening a file
cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
]])

-- 2 spaces for selected filetypes
cmd([[ autocmd FileType xml,html,xhtml,css,scssjavascript,lua,dart setlocal shiftwidth=2 tabstop=2 ]])
-- json
cmd([[ au BufEnter *.json set ai expandtab shiftwidth=2 tabstop=2 sta fo=croql ]])
