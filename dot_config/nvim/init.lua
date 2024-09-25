vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
-- Set cursor shape
vim.opt.guicursor = { "n-v-c-i:block" }

-- Line wrapping
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.showbreak = '▹'

-- Auto indent
vim.opt.autoindent = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.hlsearch = true
vim.opt.showmatch = true

-- Enable jumping into files in a search buffer
vim.opt.hidden = true

-- Backspace settings
vim.opt.backspace = { "eol", "start", "indent" }

-- Indentation settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
-- Direction keys for wrapped lines
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Up>', '<Esc>gka', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<Esc>gja', { noremap = true, silent = true })

-- Bash / Emacs keys for command line
vim.api.nvim_set_keymap('c', '<C-a>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-e>', '<End>', { noremap = true })

-- Base64 decode word under cursor
vim.api.nvim_set_keymap('n', '<Leader>b', ":!echo <C-R><C-W> | base64 -d<CR>", { noremap = true })

-- Grep recursively for word under cursor
vim.api.nvim_set_keymap('n', '<Leader>g', ":tabnew|read !grep -Hnr '<C-R><C-W>'<CR>", { noremap = true })

-- Enable wildmenu for command completion
vim.opt.wildmenu = true

-- Write current file with sudo permissions
vim.api.nvim_create_user_command('W', 'w !sudo tee % > /dev/null', {})
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
