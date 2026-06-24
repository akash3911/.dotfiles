return {
    'rcarriga/nvim-notify',
    opts = {
        render = 'wrapped-compact',
        timeout = 2500,
    },
    config = function(_, opts)
        require("notify").setup(opts)
    end,
}
