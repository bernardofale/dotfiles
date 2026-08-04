-- Visual glow-up: tabline, startup dashboard, and floating cmdline/notifications.
-- All themed by Catppuccin Mocha (see init.lua). Nothing here changes git, AI,
-- LSP, or existing keymaps — it only adds new visuals + a few buffer-nav keys.
return {
  -- ────────────────────────────────────────────────────────────────────────
  -- Bufferline: a proper tabline for open buffers, with icons + diagnostics.
  -- ────────────────────────────────────────────────────────────────────────
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
      { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = '[B]uffer [P]in' },
      { '<leader>bd', '<cmd>bdelete<cr>', desc = '[B]uffer [D]elete' },
      { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = '[B]uffer close [O]thers' },
    },
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
        show_buffer_close_icons = true,
        always_show_bufferline = true,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'Explorer',
            highlight = 'Directory',
            separator = true,
          },
        },
      },
    },
    -- Highlights are left to defaults so the tabline inherits the active
    -- colorscheme (Vague) automatically.
  },

  -- ────────────────────────────────────────────────────────────────────────
  -- Alpha: a startup dashboard with a banner and quick actions.
  -- ────────────────────────────────────────────────────────────────────────
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = {
        '                                                     ',
        '  ██████╗ ███████╗██████╗ ███╗   ██╗ █████╗ ██████╗  ',
        '  ██╔══██╗██╔════╝██╔══██╗████╗  ██║██╔══██╗██╔══██╗ ',
        '  ██████╔╝█████╗  ██████╔╝██╔██╗ ██║███████║██║  ██║ ',
        '  ██╔══██╗██╔══╝  ██╔══██╗██║╚██╗██║██╔══██║██║  ██║ ',
        '  ██████╔╝███████╗██║  ██║██║ ╚████║██║  ██║██████╔╝ ',
        '  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝  ',
        '                                                     ',
        '            n e o v i m   ·   c a t p p u c c i n    ',
        '                                                     ',
      }

      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file', '<cmd>Telescope find_files<cr>'),
        dashboard.button('r', '  Recent files', '<cmd>Telescope oldfiles<cr>'),
        dashboard.button('g', '  Live grep', '<cmd>Telescope live_grep<cr>'),
        dashboard.button('e', '  File explorer', '<cmd>NvimTreeToggle<cr>'),
        dashboard.button('a', '  Claude Code', '<cmd>ClaudeCode<cr>'),
        dashboard.button('c', '  Config', '<cmd>edit $MYVIMRC<cr>'),
        dashboard.button('l', '  Lazy', '<cmd>Lazy<cr>'),
        dashboard.button('q', '  Quit', '<cmd>qa<cr>'),
      }

      -- Generic highlight groups so the dashboard inherits whatever
      -- colorscheme is active (currently Vague).
      for _, btn in ipairs(dashboard.section.buttons.val) do
        btn.opts.hl = 'Function'
        btn.opts.hl_shortcut = 'Type'
      end
      dashboard.section.header.opts.hl = 'Keyword'
      dashboard.section.footer.opts.hl = 'Comment'

      dashboard.section.footer.val = '  Opus 4.8 is at the helm — happy hacking, Bernardo'

      alpha.setup(dashboard.config)

      -- Show a plugin-load summary in the footer once Lazy finishes.
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          local stats = require('lazy').stats()
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          dashboard.section.footer.val = string.format('  %d plugins loaded in %sms', stats.count, ms)
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  -- ────────────────────────────────────────────────────────────────────────
  -- Noice + Notify: floating command palette, LSP hover, and toast messages.
  -- If you ever dislike the floating cmdline, set cmdline.view to 'cmdline'
  -- (classic bottom bar) or remove this whole block.
  -- ────────────────────────────────────────────────────────────────────────
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    config = function(_, opts)
      require('notify').setup {
        stages = 'fade_in_slide_out',
        timeout = 2500,
        render = 'compact',
        top_down = false,
      }
      vim.notify = require 'notify'
      require('noice').setup(opts)
    end,
  },
}
