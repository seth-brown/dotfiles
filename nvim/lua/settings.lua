local utils = require "utils"

local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local indent, width = 2, 80
utils.opt("b", "expandtab", true)                     -- use spaces instead of tabs
utils.opt("b", "formatoptions", "crqnj")              -- automatic formatting options
utils.opt("b", "shiftwidth", indent)                  -- size of an indent
utils.opt("b", "textwidth", width)                    -- maximum width of text
utils.opt("b", "tabstop", indent)                     -- number of spaces tabs count for
-- utils.opt("b", 'smartindent', true)                   -- insert indents automatically

-- utils.opt("w", "colorcolumn", tostring(width))        -- line length marker
utils.opt("w", "list", false)                         -- do not show invisible characters by default
utils.opt("w", "signcolumn", "yes")                   -- show sign column
utils.opt("w", "number", true)                        -- show line numbers
utils.opt("w", "relativenumber", true)                -- show relative line numbers

utils.opt("o", "clipboard", "unnamedplus")            -- use system copy/paste
utils.opt("o", "hlsearch", true)                      -- highlight search results
utils.opt("o", "incsearch", true)                     -- show search matches as you type
utils.opt("o", "ignorecase", true)                    -- ignore case
utils.opt("o", "smartcase", true)                     -- ignore case if search pattern is lowercase
utils.opt("o", "hidden", true)                        -- enable modified buffers in background
utils.opt("o", "joinspaces", false)                   -- no double spaces with join after a dot
utils.opt("o", "shiftround", true)                    -- move in multiples of shiftwidth with < and >
utils.opt("o", "termguicolors", true)                 -- true color support
utils.opt('o', "wildmode", "list:longest")            -- command-line completion mode
utils.opt('o', "mouse", "a")                          -- allow mouse actions
utils.opt("o", 'autochdir', true)                     -- change dirs to the file in the current buff

vim.o.completeopt = "menuone,noselect"                -- required for nvim-compe completion
vim.o.shortmess = vim.o.shortmess .. "c"

-- set undofile
-- set undodir=~/.vim/undo
-- scopes.b.undofile = true                            -- maintain undo history between sessions
cmd([[ set undofile]])
cmd([[ set undodir=~/.local/share/nvim/undo/ ]])       -- set undo dir (required for mundo)
cmd([[ set backupdir=~/.local/share/nvim/backup/ ]])   -- set backup dir
cmd([[ set directory=~/.local/share/nvim/swap/ ]])     -- set swap dir
cmd([[set listchars=tab:▸\ ,eol:¬]])                   -- textmate-style tabstops/EOLs


vim.o.shortmess = vim.o.shortmess .. "c"
