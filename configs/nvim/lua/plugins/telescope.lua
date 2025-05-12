local keymap = vim.keymap

return {
  {
  	"nvim-telescope/telescope.nvim",
		version = false,
		opts = function()
			local actions = require("telescope.actions")
      local rg_ignore_patterns =
			"!{**/.git/*,**/node_modules/*,**/.idea/*,**/.elixir_ls/*,**/_build/*,**/yarn.lock,**/.yarn/*,**/fonts/*,**/coverage/*,**/cmake-build-release/*}"


			return {
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--hidden",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
          file_ignore_patterns = {
            ".png",
            ".jpg",
            ".ico",
            ".zip",
				  },
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
						},
						n = {
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
						},
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)

            local keyopts = { noremap = true, silent = true }
            keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", keyopts)
            keymap.set("n", "<leader>fp", "<cmd>Telescope live_grep<cr>", keyopts)
            keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", keyopts)
            keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", keyopts)
            keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", keyopts)
		end,
	},
}
