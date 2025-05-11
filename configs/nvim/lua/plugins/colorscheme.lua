return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent"
        },
        on_colors = function(colors)
          colors.border = "#656f9c"  -- You can adjust this hex color
        end,
      })
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
