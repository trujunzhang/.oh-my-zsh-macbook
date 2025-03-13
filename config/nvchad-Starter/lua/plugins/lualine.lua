return {
    'nvim-lualine/lualine.nvim',
    enabled = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(_, opts)
        require('lualine').setup()
    end
}
