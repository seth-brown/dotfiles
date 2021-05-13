local utils = require 'utils'
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g

g.mapleader = ","

-- system
utils.map('n', '<leader>vrc', ':e $MYVIMRC<CR>')                        -- open init.lua
utils.map('n', '<leader>src', ':luafile $MYVIMRC<CR>')                  -- source init.lua
utils.map('c', 'w!!', 'w !sudo tee % >/dev/null<CR>:e!<CR><CR>')        -- write file as root
utils.map('', '<leader>sl', '<cmd>set list!<CR>')                       -- show hidden characters
utils.map('', '<C-j>', '<cmd>:bnext<CR>')                               -- buffer cycle like a vim acolyte
utils.map('', '<C-k>', '<cmd>:bprevious<CR>')                           -- buffer cycle like a vim acolyte
utils.map('n', '<C-l>', '<cmd>nohlsearch<CR>')                          -- clear search highlights
utils.map('v', 'J', ":m '>+1<CR>gv=gv")                                 -- visual block movement (up)
utils.map('v', 'K', ":m '<-2<CR>gv=gv")                                 -- visual block movement (down)
utils.map('n', 'gV', '`[v`]')                                           -- reselect the last visual block
utils.map('n', 'J', 'mzJ`z')                                            -- join lines, but keep cursor stationary
utils.map('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w')  -- split lines (reciprocal of join, J)

-- lsp
utils.map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')               -- go to definition
utils.map('n', 'gD', ':lua vim.lsp.buf.implementation()<CR>')           -- go to impl
utils.map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')                     -- display under cursor
-- :lua vim.lsp.buf.definition()<CR>
-- :lua vim.lsp.buf.hover()<CR>
-- :lua vim.lsp.buf.implementation()<CR>
-- :lua vim.lsp.buf.signature_help()<CR>
-- :lua vim.lsp.buf.type_definition()<CR>
-- :lua vim.lsp.buf.references()<CR>
-- :lua vim.lsp.buf.document_symbol()<CR>
-- :lua vim.lsp.buf.workspace_symbol()<CR>
-- :lua vim.lsp.buf.declaration()<CR>

-- misc
utils.map('n', '<leader>g', ':MundoToggle<CR>')                         -- toggle mundo

-- hop motions
utils.map('n', '<leader>w', '<cmd>HopWord<CR>')                              -- easymotion/hop by word
utils.map('n', '<leader>l', '<cmd>HopLine<CR>')                              -- easymotion/hop by line

-- telescope
utils.map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>')                   --fuzzy
utils.map('n', '<leader><space>', '<cmd>Telescope find_files<CR>')
utils.map('n', '<leader>f', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
