local keymap = vim.keymap

return {
	{
		"ggandor/lightspeed.nvim",
		config = function(_, _)
			local opts = { noremap = true, silent = true }
			keymap.set("n", "<leader>s", "<Plug>Lightspeed_s", opts)
			keymap.set("n", "<leader>S", "<Plug>Lightspeed_S", opts)
			keymap.set("v", "<leader>s", "<Plug>Lightspeed_s", opts)
			keymap.set("v", "<leader>S", "<Plug>Lightspeed_S", opts)

			vim.cmd("silent! unmap s")
			vim.cmd("silent! unmap S")

			vim.api.nvim_set_hl(
				0,
				"LightspeedCursor",
				{ bg = "#af0f0f", fg = "#f0f0ff", bold = true, underline = true }
			)
		end,
	},

	{ "psliwka/vim-smoothie" },

	{ "tpope/vim-repeat" },

	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = true, -- if you want to enable the plugin
			message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},
	},
	{
		"giusgad/pets.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
		config = function()
			require("pets").setup({
				row = 1, -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
				col = 0, -- the column to display the pet at (set to high number to have it stay still on the right side)
				speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
				default_pet = "dog", -- the pet to use for the PetNew command
				default_style = "brown", -- the style of the pet to use for the PetNew command
				random = true, -- whether to use a random pet for the PetNew command, overrides default_pet and default_style
				death_animation = true, -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
				popup = { -- popup options, try changing these if you see a rectangle around the pets
					width = "30%", -- can be a string with percentage like "45%" or a number of columns like 45
					winblend = 100, -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
					hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
					avoid_statusline = false, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
					-- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
				},
			})
		end,
	},

	{
		"y3owk1n/undo-glow.nvim",
		event = { "VeryLazy" },
		---@type UndoGlow.Config
		opts = {
			animation = {
				enabled = true,
				duration = 300,
				animtion_type = "zoom",
				window_scoped = true,
			},
			highlights = {
				undo = {
					hl_color = { bg = "#693232" }, -- Dark muted red
				},
				redo = {
					hl_color = { bg = "#2F4640" }, -- Dark muted green
				},
				yank = {
					hl_color = { bg = "#7A683A" }, -- Dark muted yellow
				},
				paste = {
					hl_color = { bg = "#325B5B" }, -- Dark muted cyan
				},
				search = {
					hl_color = { bg = "#5C475C" }, -- Dark muted purple
				},
				comment = {
					hl_color = { bg = "#7A5A3D" }, -- Dark muted orange
				},
				cursor = {
					hl_color = { bg = "#793D54" }, -- Dark muted pink
				},
			},
			priority = 2048 * 3,
		},
		keys = {
			{
				"u",
				function()
					require("undo-glow").undo()
				end,
				mode = "n",
				desc = "Undo with highlight",
				noremap = true,
			},
			{
				"U",
				function()
					require("undo-glow").redo()
				end,
				mode = "n",
				desc = "Redo with highlight",
				noremap = true,
			},
			{
				"p",
				function()
					require("undo-glow").paste_below()
				end,
				mode = "n",
				desc = "Paste below with highlight",
				noremap = true,
			},
			{
				"P",
				function()
					require("undo-glow").paste_above()
				end,
				mode = "n",
				desc = "Paste above with highlight",
				noremap = true,
			},
			{
				"n",
				function()
					require("undo-glow").search_next({
						animation = {
							animation_type = "strobe",
						},
					})
				end,
				mode = "n",
				desc = "Search next with highlight",
				noremap = true,
			},
			{
				"N",
				function()
					require("undo-glow").search_prev({
						animation = {
							animation_type = "strobe",
						},
					})
				end,
				mode = "n",
				desc = "Search prev with highlight",
				noremap = true,
			},
			{
				"*",
				function()
					require("undo-glow").search_star({
						animation = {
							animation_type = "strobe",
						},
					})
				end,
				mode = "n",
				desc = "Search star with highlight",
				noremap = true,
			},
			{
				"#",
				function()
					require("undo-glow").search_hash({
						animation = {
							animation_type = "strobe",
						},
					})
				end,
				mode = "n",
				desc = "Search hash with highlight",
				noremap = true,
			},
			{
				"gc",
				function()
					-- This is an implementation to preserve the cursor position
					local pos = vim.fn.getpos(".")
					vim.schedule(function()
						vim.fn.setpos(".", pos)
					end)
					return require("undo-glow").comment()
				end,
				mode = { "n", "x" },
				desc = "Toggle comment with highlight",
				expr = true,
				noremap = true,
			},
			{
				"gc",
				function()
					require("undo-glow").comment_textobject()
				end,
				mode = "o",
				desc = "Comment textobject with highlight",
				noremap = true,
			},
			{
				"gcc",
				function()
					return require("undo-glow").comment_line()
				end,
				mode = "n",
				desc = "Toggle comment line with highlight",
				expr = true,
				noremap = true,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("TextYankPost", {
				desc = "Highlight when yanking (copying) text",
				callback = function()
					require("undo-glow").yank()
				end,
			})

			-- This only handles neovim instance and do not highlight when switching panes in tmux
			vim.api.nvim_create_autocmd("CursorMoved", {
				desc = "Highlight when cursor moved significantly",
				callback = function()
					require("undo-glow").cursor_moved({
						animation = {
							animation_type = "slide",
						},
					})
				end,
			})

			-- This will handle highlights when focus gained, including switching panes in tmux
			vim.api.nvim_create_autocmd("FocusGained", {
				desc = "Highlight when focus gained",
				callback = function()
					---@type UndoGlow.CommandOpts
					local opts = {
						animation = {
							animation_type = "slide",
						},
					}

					opts = require("undo-glow.utils").merge_command_opts("UgCursor", opts)
					local pos = require("undo-glow.utils").get_current_cursor_row()

					require("undo-glow").highlight_region(vim.tbl_extend("force", opts, {
						s_row = pos.s_row,
						s_col = pos.s_col,
						e_row = pos.e_row,
						e_col = pos.e_col,
						force_edge = opts.force_edge == nil and true or opts.force_edge,
					}))
				end,
			})

			vim.api.nvim_create_autocmd("CmdLineLeave", {
				pattern = { "/", "?" },
				desc = "Highlight when search cmdline leave",
				callback = function()
					require("undo-glow").search_cmd({
						animation = {
							animation_type = "fade",
						},
					})
				end,
			})
		end,
	},
}
