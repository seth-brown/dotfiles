local cmd, g, fn, execute = vim.cmd, vim.g, vim.fn, vim.api_nvim_command
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-- install packer if it isn't installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

--setup packer
require('packer').startup(function()
  use "wbthomason/packer.nvim"

  -- utils
  use 'phaazon/hop.nvim'
  use 'simnalamburt/vim-mundo'
  use 'b3nj5m1n/kommentary' 
  use 'mhartington/formatter.nvim'

  -- navigation
  use {'nvim-telescope/telescope.nvim', 
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  -- completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'folke/lsp-trouble.nvim'
  use 'kabouzeid/nvim-lspinstall'

  -- snippets
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'

  -- asethetics
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'}

  -- color
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'folke/tokyonight.nvim'

  use {'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

end)

--theme
g.tokyonight_italic_comments = true
g.tokyonight_italic_keywords = true
vim.cmd[[colorscheme tokyonight]]

g.indent_blankline_show_first_indent_level = false
g.indentline_setColors = 0

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

--nvim-compe
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    spell = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

-- nvim treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  }
}

-- gitsigns
require('gitsigns').setup {
 signs = {
    add          = {hl = 'GitSignsAdd'   , text = '∙', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '∙', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '∙', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '∙', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '∙', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true,  -- If luajit is present
}

-- Snippets support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = true,
		signs = true,
	}
)

require('lspkind').init({
    with_text = true,
    symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
    },
})

-- local on_attach = function(client, bufnr)
--   nvim_command('autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()')
-- end

--lsp isntaller
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}

  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

require("trouble").setup {
    height = 7, -- height of the trouble list
    icons = true, -- use devicons for filenames
    mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    action_keys = { -- key mappings for actions in the trouble list
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small poup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = true, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = true, -- automatically fold a file trouble list at creation
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

require'lspsaga'.init_lsp_saga{
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = ""
}

--telescope
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = true,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

require('mappings')
require('settings')

require('lualine').setup{
  options = {
    theme = 'tokyonight',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''}, {'filename'} },
    lualine_c = {{'diagnostics', sources = {'nvim_lsp'}, sections = {'error', 'warn', 'info'}}},
    lualine_x = { 'encoding', 'filetype' },
    -- lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  -- inactive_sections = {
  --   lualine_a = {  },
  --   lualine_b = {  },
  --   lualine_c = { 'filename' },
  --   lualine_x = { 'location' },
  --   lualine_y = {  },
  --   lualine_z = {  }
  -- },
  -- extensions = { 'fzf' }
}

local prettierFmt = function()
  return {
    exe = "npx",
    args = {"prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end


local rustFmt = function()
  return {
    exe = "rustfmt",
    args = {"--emit=stdout"},
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
      typescript = {prettierFmt},
      typescriptreact = {prettierFmt},
      rust = {rustFmt}
  }
})

vim.api.nvim_command([[
  augroup TypescriptReact
    autocmd bufnewfile,bufread *.tsx set filetype=typescriptreact
  augroup END 
]])

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.rs FormatWrite
augroup END
]], true)
