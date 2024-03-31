local dap = require('dap')
local dapui = require('dapui')
local icons = require('lib.icons')

require('dap-vscode-js').setup({
    debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

require('jester').setup({
    dap = {
        type = 'pwa-node',
        -- console = 'externalTerminal',
    },
})

for _, language in ipairs({ 'typescript', 'javascript', 'svelte' }) do
    dap.configurations[language] = {
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = 'pwa-node',
            -- attach to an already running node process with --inspect flag
            -- default port: 9222
            request = 'attach',
            -- allows us to pick the process using a picker
            processId = require('dap.utils').pick_process,
            -- name of the debug action you have to select for this config
            name = 'Attach debugger to existing `node --inspect` process',
            -- for compiled languages like TypeScript or Svelte.js
            sourceMaps = true,
            -- resolve source maps in nested locations while ignoring node_modules
            resolveSourceMapLocations = {
                '${workspaceFolder}/**',
                '!**/node_modules/**',
            },
            -- path to src in vite based projects (and most other projects as well)
            cwd = '${workspaceFolder}/src',
            -- we don't want to debug code inside node_modules, so skip it!
            skipFiles = { '${workspaceFolder}/node_modules/**/*.js' },
        },
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Debug Jest Tests',
            -- trace = true, -- include debugger info
            runtimeExecutable = 'node',
            runtimeArgs = {
                './node_modules/jest/bin/jest.js',
                '--runInBand',
            },
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
            internalConsoleOptions = 'neverOpen',
        },
        {
            type = 'pwa-chrome',
            name = 'Launch Chrome to debug client',
            request = 'launch',
            url = 'http://localhost:5173',
            sourceMaps = true,
            protocol = 'inspector',
            port = 9222,
            webRoot = '${workspaceFolder}/src',
            -- skip files from vite's hmr
            skipFiles = { '**/node_modules/**/*', '**/@vite/*', '**/src/client/*', '**/src/*' },
        },
        -- only if language is javascript, offer this debug action
        language == 'javascript'
        and {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = 'pwa-node',
            -- launch a new process to attach the debugger to
            request = 'launch',
            -- name of the debug action you have to select for this config
            name = 'Launch file in new node process',
            -- launch current file
            program = '${file}',
            cwd = '${workspaceFolder}',
        }
        or nil,
    }
end

dapui.setup({
    icons = { expanded = icons.ui.ArrowClosed, collapsed = icons.ui.ArrowOpen },
    mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
    },
    expand_lines = vim.fn.has('nvim-0.7'),
    layouts = {
        {
            elements = {
                { id = 'scopes', size = 0.25 },
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40,
            position = 'right',
        },
        {
            elements = {
                'repl',
                'console',
            },
            size = 0.25,
            position = 'bottom',
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = 'rounded',
        mappings = {
            close = { 'q', '<Esc>' },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
    },
})

vim.fn.sign_define('DapBreakpoint', { text = icons.ui.Bug, texthl = 'DiagnosticSignError', linehl = '', numhl = '' })

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

dap.adapters.python = {
    type = 'executable',
    command = '/usr/bin/python',
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',

        program = '${file}',
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end,
    },
}

dap.adapters.ruby = {
    type = 'executable',
    command = 'bundle',
    args = { 'exec', 'readapt', 'stdio' },
}

dap.configurations.ruby = {
    {
        type = 'ruby',
        request = 'launch',
        name = 'Rails',
        program = 'bundle',
        programArgs = { 'exec', 'rails', 's' },
        useBundler = true,
    },
}

vim.api.nvim_create_user_command('DapUIToggle', function()
    require('dapui').toggle()
end, {})
