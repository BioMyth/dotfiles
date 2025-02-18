return {
--    {"williamboman/mason.nvim"},
--    {"williamboman/mason-lspconfig.nvim", config = function() end},
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Include LSP as basic plugins
            "mason.nvim",
            {"williamboman/mason-lspconfig.nvim", config = function() end}
        }
    },
}

