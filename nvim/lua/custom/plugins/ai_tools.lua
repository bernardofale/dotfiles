return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false,
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'echasnovski/mini.pick',
    },
    keys = {
      { '<leader>aa', function() require('avante.api').ask() end, desc = '[A]I [A]sk Avante' },
      { '<leader>ar', function() require('avante.api').refresh() end, desc = '[A]I [R]efresh' },
      { '<leader>ae', function() require('avante.api').edit() end, desc = '[A]I [E]dit' },
      { '<leader>at', function() require('avante').toggle_sidebar() end, desc = '[A]I [T]oggle sidebar' },
      {
        '<leader>ap',
        function()
          vim.ui.select(
            { 'claude', 'openai', 'copilot', 'azure', 'gemini' },
            { prompt = 'Select AI Provider: ' },
            function(choice)
              if choice then
                vim.g.avante_provider = choice
                vim.notify('Switched to ' .. choice .. ' provider', vim.log.levels.INFO)
              end
            end
          )
        end,
        desc = '[A]I [P]rovider switch',
      },
    },
    config = function()
      require('avante_lib').load()
      require('avante').setup {
        provider = 'claude',
        auto_suggestions_provider = 'claude',
        claude = {
          endpoint = 'https://api.anthropic.com',
          model = 'claude-opus-4-1',
          temperature = 0,
          max_tokens = 4096,
        },
        behaviour = {
          auto_suggestions = false,
        },
        windows = {
          wrap = true,
          width = 30,
          sidebar_header = {
            align = 'left',
            rounded = true,
          },
        },
        highlights = {
          ---@type AvanteConflictHighlights
          diff = {
            current = 'DiffText',
            incoming = 'DiffAdd',
          },
        },
        --- @type table
        file_selector = {
          provider = 'fzf',
          -- Options override for fzf select
          provider_opts = {},
        },
      }
    end,
  },
}
