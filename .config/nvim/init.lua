vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        disable_netrw = true,
        view = {
          signcolumn = "no",
        },
        filters = {
          git_ignored = false,
          dotfiles = false,
        },
        renderer = {
          highlight_git = "name",
          highlight_clipboard = "name",
          icons = {
            web_devicons = {
              file = {
                enable = false,
              },
              folder = {
                enable = false,
              },
            },
            padding = {
              icon = "",
              folder_arrow = "",
            },
            symlink_arrow = "",
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
              modified = false,
              hidden = false,
              diagnostics = false,
              bookmarks = false,
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
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts_install = require("nvim-treesitter").install({
        "yaml", "markdown", "markdown_inline",
        "python", "javascript", "typescript", "tsx",
        "html", "css", "scss", "vue", "json", "go", "lua",
      })
      if #vim.api.nvim_list_uis() == 0 then
        ts_install:wait(600000)
      end

      vim.treesitter.language.register("javascript", "javascriptreact")
      vim.treesitter.language.register("tsx", "typescriptreact")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "yaml", "markdown",
          "python", "javascript", "javascriptreact",
          "typescript", "typescriptreact",
          "html", "css", "scss", "vue", "json", "go", "lua",
        },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionActions",
      "CodeCompanionCmd",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          http = {
            anthropic = function()
              return require("codecompanion.adapters").extend("anthropic", {
                schema = {
                  model = {
                    default = "claude-opus-4-8",
                  },
                },
              })
            end,
          },
        },
        strategies = {
          inline = { adapter = "anthropic" },
          chat = { adapter = "anthropic" },
          cmd = { adapter = "anthropic" },
        },
        display = {
          chat = {
            show_settings = true,
            icons = {
              buffer_sync_all = "",
              buffer_sync_diff = "",
              chat_context = "",
              chat_fold = "",
              tool_pending = "",
              tool_in_progress = "",
              tool_failure = "",
              tool_success = "",
            },
          },
        },
      })
    end,
  },
})
