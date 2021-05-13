local utils = { }

local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local fmt = string.format

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.is_buffer_empty()
    -- Check whether the current buffer is empty
    return fn.empty(vim.fn.expand('%:t')) == 1
end

function utils.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return fn.winwidth(0) / 2 > cols
end

return utils
