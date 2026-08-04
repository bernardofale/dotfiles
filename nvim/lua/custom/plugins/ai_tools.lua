return {
  {
    'greggh/claude-code.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = {
      'ClaudeCode',
      'ClaudeCodeContinue',
      'ClaudeCodeResume',
      'ClaudeCodeVerbose',
    },
    keys = {
      { '<leader>ac', '<cmd>ClaudeCode<CR>', desc = '[A]I [C]laude Code' },
      { '<leader>aC', '<cmd>ClaudeCodeContinue<CR>', desc = '[A]I Claude [C]ontinue' },
      { '<leader>ar', '<cmd>ClaudeCodeResume<CR>', desc = '[A]I Claude [R]esume' },
    },
    config = function()
      require('claude-code').setup {
        window = {
          position = 'vertical',
          split_ratio = 0.4,
        },
      }
    end,
  },
  {
    'kkrampis/codex.nvim',
    cmd = { 'Codex', 'CodexToggle' },
    keys = {
      {
        '<leader>ax',
        function()
          require('codex').toggle()
          vim.schedule(function()
            if vim.bo.buftype == 'terminal' then
              vim.cmd.startinsert()
            end
          end)
        end,
        desc = '[A]I Code[x]',
        mode = { 'n', 't' },
      },
      { '<leader>at', '<cmd>CodexToggle<CR>', desc = '[A]I Codex [T]oggle' },
    },
    opts = {
      keymaps = {
        toggle = nil,
        quit = '<C-q>',
      },
      border = 'rounded',
      width = 0.4,
      height = 0.8,
      model = nil,
      autoinstall = true,
      panel = true,
      use_buffer = false,
    },
    config = function(_, opts)
      require('codex').setup(opts)

      vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
        pattern = 'term://*codex*',
        callback = function()
          if vim.bo.buftype == 'terminal' then
            vim.cmd.startinsert()
          end
        end,
      })
    end,
  },
}
