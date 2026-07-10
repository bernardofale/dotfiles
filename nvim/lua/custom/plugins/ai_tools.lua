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
          local providers = { 'claude', 'openai', 'copilot', 'azure', 'gemini' }
          vim.ui.select(
            providers,
            { prompt = 'Select AI Provider: ' },
            function(choice)
              if choice then
                require('avante.config').provider = choice
                vim.notify('Switched to ' .. choice .. ' provider', vim.log.levels.INFO)
              end
            end
          )
        end,
        desc = '[A]I [P]rovider switch',
      },
      {
        '<leader>am',
        function()
          local models = {
            { 'claude-opus-4-1', 'claude' },
            { 'claude-sonnet-4-20250514', 'claude' },
            { 'claude-haiku-3-5-20241022', 'claude' },
            { 'gpt-4o', 'openai' },
            { 'gpt-4-turbo', 'openai' },
            { 'gpt-4', 'openai' },
            { 'gpt-3.5-turbo', 'openai' },
          }
          vim.ui.select(
            models,
            { prompt = 'Select Model: ' },
            function(choice)
              if choice then
                local config = require('avante.config')
                local model_name = choice[1]
                local provider = choice[2]
                config.provider = provider
                if provider == 'claude' then
                  config.claude.model = model_name
                elseif provider == 'openai' then
                  config.openai.model = model_name
                end
                vim.notify('Switched to ' .. model_name, vim.log.levels.INFO)
              end
            end
          )
        end,
        desc = '[A]I [M]odel switch',
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
        openai = {
          endpoint = 'https://api.openai.com/v1',
          model = 'gpt-4o',
          temperature = 0,
          max_tokens = 4096,
        },
        copilot = {
          model = 'gpt-4-turbo',
          temperature = 0,
          max_tokens = 4096,
        },
        azure = {
          endpoint = '',
          model = '',
          api_version = '2024-02-15-preview',
          temperature = 0,
          max_tokens = 4096,
        },
        gemini = {
          model = 'gemini-2.0-flash',
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
          diff = {
            current = 'DiffText',
            incoming = 'DiffAdd',
          },
        },
        file_selector = {
          provider = 'fzf',
          provider_opts = {},
        },
      }
    end,
  },
}
