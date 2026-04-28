if not vim.g.vscode then
	return {

		{
			"marko-cerovac/material.nvim",
			lazy = false,
			priority = 1000,
			init = function()
				-- 'darker', 'lighter', 'oceanic', 'palenight', 'deep ocean'
				vim.g.material_style = "deep ocean"
			end,
			config = function()
				require("material").setup({
					disable = {
						background = true, -- disables setting the background color
					},
				})
				vim.cmd([[colorscheme material]])
				vim.cmd([[hi StatusLine guibg=NONE ctermbg=NONE]])
			end,
		},
		{
			"folke/tokyonight.nvim",
			lazy = true,
			config = function()
				require("tokyonight").setup({
					transparent = true,
					styles = {
						sidebars = "transparent",
						floats = "transparent",
					},
					on_colors = function(colors)
						colors.border = "#656f9c" -- You can adjust this hex color
					end,
				})
				--vim.cmd([[colorscheme tokyonight-night]])
			end,
		},
	}
end
