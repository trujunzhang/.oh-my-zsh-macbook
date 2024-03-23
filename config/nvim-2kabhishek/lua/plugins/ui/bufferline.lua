vim.opt.termguicolors = true
require('bufferline').setup({
    options = {
        mode = 'buffers',
        numbers = 'buffer_id',
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                separator = true,
            },
        },
    },
})
