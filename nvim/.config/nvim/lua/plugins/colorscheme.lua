return {
        "marko-cerovac/material.nvim",
        lazy = false,
        priority = 1000,

        config = function()
                -- load your preferred variant
                vim.g.material_style = "oceanic" -- options: darker, lighter, oceanic, palenight, deep ocean

                -- apply the theme
                vim.cmd.colorscheme("material")
        end,
}
