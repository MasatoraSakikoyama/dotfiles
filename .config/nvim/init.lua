local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.list = true
opt.number = true
opt.title = true
opt.virtualedit = "onemore"
opt.smartindent = true
opt.visualbell = true
opt.showmatch = true
opt.laststatus = 3
opt.wildmode = "list:longest"
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = true
opt.hlsearch = true
opt.splitbelow = true
opt.splitright = true
opt.fileencoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.hidden = true
opt.showcmd = true
opt.backspace = { "indent", "eol", "start" }
opt.clipboard = "unnamedplus"
opt.termguicolors = true

vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true })

local indent_group = vim.api.nvim_create_augroup("fileTypeIndent", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = indent_group,
  pattern = "*.py",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = indent_group,
  pattern = { "*.js", "*.jsx", "*.ts", "*.html", "*.css", "*.scss", "*.vue", "*.json" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = indent_group,
  pattern = "*.go",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

require("lazy").setup({
  {
    "jpo/vim-railscasts-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("railscasts")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,
        },
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
            },
          },
        },
        update_focused_file = {
          enable = true,
        },
      })

      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { silent = true })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = false,
          theme = "auto",
          section_separators = { left = "", right = "" },
          component_separators = { left = "|", right = "|" },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
})
