local overrides = require "custom.configs.overrides"

-- vim.opt.termguicolors = true
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- vim.o.spell = true

local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- code formatting, linting etc
  {
    event = "BufEnter",
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "custom.configs.null-ls"
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    override_options = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    override_options = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    override_options = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "williamboman/nvim-lsp-installer",
    event = "BufRead",
    config = function()
      local lsp_installer = require("nvim-lsp-installer")

        lsp_installer.on_server_ready(function(server)
        local opts = {}
        server:setup(opts)
        vim.cmd([[ do User LspAttachBuffers ]])
      end)
    end,
  },

  -- Rainbow indent plugin
  {
    "p00f/nvim-ts-rainbow",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      }
    end,
  },

  -- Rainbow brackets plugin
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("indent_blankline").setup {
  --       use_treesitter = true,
  --       space_char_blankline = " ",
  --       show_current_context_start = true,
  --       char_highlight_list = {
  --         "IndentBlanklineIndent1",
  --         "IndentBlanklineIndent2",
  --         "IndentBlanklineIndent3",
  --         "IndentBlanklineIndent4",
  --         "IndentBlanklineIndent5",
  --         "IndentBlanklineIndent6",
  --       },
  --       show_current_context = true,
  --       filetype_exclude = { "help", "dashboard", "dashpreview", "NvimTree", "vista", "sagahover" },
  --       buftype_exclude = { "terminal", "nofile" },
  --       context_patterns = {
  --         "class",
  --         "function",
  --         "method",
  --         "block",
  --         "list_literal",
  --         "selector",
  --         "^if",
  --         "^table",
  --         "if_statement",
  --         "while",
  --         "for",
  --         "loop",
  --         "fn",
  --         "func",
  --       },
  --     }
  --   end,
  -- },
  --
  -- Copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = {"InsertEnter", "BufEnter", "BufRead"},
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = true,
  --         auto_refresh = true,
  --         keymap = {
  --           jump_prev = "[[",
  --           jump_next = "]]",
  --           accept = "<CR>",
  --           refresh = "gr",
  --           open = "<M-CR>"
  --         },
  --         layout = {
  --           position = "bottom", -- | top | left | right
  --           ratio = 0.4
  --         },
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_accept = true,
  --         auto_trigger = true,
  --         debounce = 75,
  --         keymap = {
  --           accept = "<Tab>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>",
  --         },
  --       },
  --       filetypes = {
  --         yaml = false,
  --         markdown = false,
  --         help = false,
  --         gitcommit = false,
  --         gitrebase = false,
  --         hgcommit = false,
  --         svn = false,
  --         cvs = false,
  --         ["."] = false,
  --       },
  --       copilot_node_command = 'node', -- Node.js version must be > 16.x
  --       server_opts_overrides = {},
  --     })
  --   end,
  -- },
  --
  {
    "m4xshen/autoclose.nvim",
    event = "BufEnter",
    config = function()
      require("autoclose").setup()
    end,
  },


  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>j", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" } },
  },


  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}

return plugins

