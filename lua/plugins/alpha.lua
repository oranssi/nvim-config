return {

--  { "nvimdev/dashboard-nvim", enabled = false },
--  { "echasnovski/mini.starter", enabled = false },
--  -- Dashboard. This runs when neovim starts, and is what displays
  -- the "LAZYVIM" banner.
--  {
--    "goolord/alpha-nvim",
--    event = "VimEnter",
--    enabled = true,
--    init = false,
-- opts = function()
--      local dashboard = require("alpha.themes.dashboard")
--      local logo = [[
--    "                                                     ",
--    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--    "                                                     ",
--    ]]
--
--    dashboard.section.header.val = vim.split(logo, "\n")
--      -- stylua: ignore
--      dashboard.section.buttons.val = {
--        dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
--        dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
--        dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
--        dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
--        dashboard.button("c", " " .. " Config",          "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
--        dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
--        dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
--        dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
--        dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
--      }
--      for _, button in ipairs(dashboard.section.buttons.val) do
--        button.opts.hl = "AlphaButtons"
--        button.opts.hl_shortcut = "AlphaShortcut"
--      end
--      dashboard.section.header.opts.hl = "AlphaHeader"
--      dashboard.section.buttons.opts.hl = "AlphaButtons"
--      dashboard.section.footer.opts.hl = "AlphaFooter"
--      dashboard.opts.layout[1].val = 8
--      return dashboard
--    end,
--    config = function(_, dashboard)
--      -- close Lazy and re-open when the dashboard is ready
--      if vim.o.filetype == "lazy" then
--        vim.cmd.close()
--        vim.api.nvim_create_autocmd("User", {
--          once = true,
--          pattern = "AlphaReady",
--          callback = function()
--            require("lazy").show()
--          end,
--        })
--      end
--
--      require("alpha").setup(dashboard.opts)
--
--      vim.api.nvim_create_autocmd("User", {
--        once = true,
--        pattern = "LazyVimStarted",
--        callback = function()
--          local stats = require("lazy").stats()
--          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
--          dashboard.section.footer.val = "⚡ Neovim loaded "
--            .. stats.loaded
--            .. "/"
--            .. stats.count
--            .. " plugins in "
--            .. ms
--            .. "ms"
--          pcall(vim.cmd.AlphaRedraw)
--        end,
--      })
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      highlights = {
        fill = {
          bg = {
            attribute = "bg",
            highlight = "bg",
          },
        },
      },
    },
    keys = {
      { "<leader>bp", "<cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
      { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>",          desc = "Close other buffers" },
      { "<leader>br", "<cmd>BufferLineCloseRight<CR>",           desc = "Close right buffer" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<CR>",            desc = "Close left buffer" },
      { "<Tab>",      "<cmd>BufferLineCycleNext<CR>",            desc = "Next buffer" },
      { "<S-Tab>",    "<cmd>BufferLineCyclePrev<CR>",            desc = "Previous buffer" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        disabled_filetypes = {
          "alpha",
          "neo-tree",
          "Outline",
          "Trouble",
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
    },
    main = "ibl",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
      },
    },
    keys = {
      {
        "<leader>nl",
        function()
          require("noice").cmd("last")
        end,
        desc = "Last",
      },
      {
        "<leader>nh",
        function()
          require("noice").cmd("history")
        end,
        desc = "History",
      },
      {
        "<leader>nd",
        function()
          require("noice").cmd("dismiss")
        end,
        desc = "Dismiss all",
      },
    },
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      --Set header
      dashboard.section.header.val = {
        "███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ",
        "███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ",
        "███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ",
        "███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
        "███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
        "███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ",
        "███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ",
        " ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("n", "  New file", "<cmd>ene<CR>"),
--        dashboard.button(
--          "SPC q l",
--          "  Restore last session",
--          [[<cmd>lua require("persistence").load({ last = true })<CR>]]
--        ),
        dashboard.button("SPC f r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("SPC f f", "  Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("SPC f p", "  Projects", "<cmd>Telescope projects<CR>"),
        dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
        dashboard.button("m", "󱌣  Mason", "<cmd>Mason<CR>"),
        dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
      }

      return dashboard
    end,
    config = function(_, dashboard)
      local alpha = require("alpha")

      vim.api.nvim_create_autocmd("User", {
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100) / 100
          dashboard.section.footer.val = "󱐌 Lazy-loaded "
              .. stats.loaded
              .. "/"
              .. stats.count
              .. " plugins in "
              .. ms
              .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      alpha.setup(dashboard.opts)
    end,
  },
}
