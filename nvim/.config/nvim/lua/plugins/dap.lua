local M = {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-dap.nvim',
  },
  element_mappings = {
    stacks = {
      open = '<CR>',
      expand = 'o',
    },
  },
}

local last_run = nil

M.config = function()
  local dap = require 'dap'
  local dapui = require 'dapui'

  require('mason-nvim-dap').setup {
    automatic_installation = true,
    handlers = {},
    ensure_installed = { 'codelldb' },
  }

  require('nvim-dap-virtual-text').setup {
    virt_tex_pos = 'eol',
  }

  -- Store the config for 'dap.last_run()'
  dap.listeners.after.event_initialized['store_config'] = function(session)
    if session.config then
      last_run = {
        config = session.config,
      }
    end
  end

  -- Reimplement last_run to store the config
  -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
  local function dap_run_last()
    if last_run and last_run.config then
      dap.run(last_run.config)
    else
      dap.continue()
    end
  end

  local function keymap(key, command, desc)
    vim.keymap.set({ 'n', 'v' }, key, command, { silent = true, desc = desc })
  end

  keymap('<F1>', "<cmd>lua require('dapui').toggle()<CR>", 'DAP: Toggle UI')
  keymap('<F2>', "<cmd>lua require('dap').step_into()<CR>", 'DAP: Step Into')
  keymap('<F3>', "<cmd>lua require('dap').step_over()<CR>", 'DAP: Step Over')
  keymap('<F4>', "<cmd>lua require('dap').step_out()<CR>", 'DAP: Step Out')
  keymap('<F5>', "<cmd>lua require('dap').step_back()<CR>", 'DAP: Step Back')
  keymap('<F6>', function()
    dap_run_last()
  end, 'DAP: Run Last')
  keymap('<F7>', "<cmd>lua require('dap').continue()<CR>", 'DAP: Launch or Continue')
  keymap('<leader>dt', "<cmd>lua require('dap').terminate()<CR>", 'DAP: Terminate')
  keymap('<leader>dd', "<cmd>lua require('dap').disconnect()<CR>", 'DAP: Disconnect')
  keymap('<leader>db', "<cmd>lua require('dap').toggle_breakpoint()<CR>", 'DAP: Set Breakpoint')
  keymap('<leader>dB', "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", 'DAP: Set Breakpoint Condition')

  keymap('<leader>dp', function()
    dap.up()
  end, 'DAP: Stack Up')
  keymap('<leader>dn', function()
    dap.down()
  end, 'DAP: Stack Down')

  local telescope_dap = require('telescope').extensions.dap
  keymap('<leader>d?', function()
    telescope_dap.commands {}
  end, 'DAP: Built-in Commands')
  keymap('<leader>dl', function()
    telescope_dap.list_breakpoints {}
  end, 'DAP: List Breakpoints')
  keymap('<leader>df', function()
    telescope_dap.frames()
  end, 'DAP: Frames')
  keymap('<leader>dv', function()
    telescope_dap.variables()
  end, 'DAP: Variables')
  keymap('<leader>dc', function()
    telescope_dap.configurations()
  end, 'DAP: Debugger Configs')

  require('telescope').load_extension 'dap'

  dapui.setup {
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
      icons = {
        pause = '⏸',
        play = '▶',
        step_into = '⏎(F2)',
        step_over = '⏭(F3)',
        step_out = '⏮(F4)',
        step_back = 'b(F5)',
        run_last = '▶▶(F6)',
        terminate = '⏹[l]dt',
        disconnect = '⏏[l]dd',
      },
    },
    layouts = {
      {
        elements = {
          -- { id = "scopes", size = 0.25, },
          { id = 'stacks', size = 0.50 },
          { id = 'breakpoints', size = 0.25 },
          { id = 'watches', size = 0.25 },
        },
        size = 56,
        position = 'right', -- Can be "left" or "right"
      },
      {
        elements = {
          { id = 'repl', size = 0.60 },
          { id = 'console', size = 0.40 },
        },
        size = 8,
        position = 'bottom', -- Can be "bottom" or "top"
      },
    },
  }

  dap.listeners.after.event_initialized['dapui_config'] = dapui.open
  dap.listeners.before.event_terminated['dapui_config'] = dapui.close
  dap.listeners.before.event_exited['dapui_config'] = dapui.close

  -- C/C++/Rust
  dap.adapters.codelldb = {
    type = 'executable',
    command = 'codelldb',

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
  dap.configurations.cpp = {
    {
      name = 'Launch file',
      type = 'codelldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
    {
      name = 'Launch file with arguments',
      type = 'codelldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      args = function()
        local args_string = vim.fn.input('Arguments: ', '', 'file')
        return vim.split(args_string, ' +')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

  -- Godot
  dap.adapters.godot = { type = 'server', host = '127.0.0.1', port = 6006 }
  dap.configurations.gdscript = {
    { type = 'godot', request = 'launch', name = 'Launch scene', project = '${workspaceFolder}' },
  }
end

return M
