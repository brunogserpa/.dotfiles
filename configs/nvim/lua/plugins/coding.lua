local keymap = vim.keymap
local utils_cmp = require("utils.cmp")

local plugins = {}

if not vim.g.vscode then
	-- Nvim Cmp
	table.insert(plugins, {
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"rafamadriz/friendly-snippets",
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			local auto_select = true

			return {
				completion = { completeopt = "menu,menuone,noinsert" },
				preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-g>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = utils_cmp.confirm({ select = auto_select }),
					["<C-y>"] = utils_cmp.confirm({ select = true }),
					["<S-CR>"] = utils_cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
					["<C-CR>"] = function(fallback)
						cmp.abort()
						fallback()
					end,
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
				}, {
					{ name = "path" },
					{ name = "buffer" },
					{ name = "emoji" },
					{ name = "nvim_lsp", trigger_characters = { "-" } },
				}),
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				sorting = defaults.sorting,
			}
		end,
	})

	table.insert(plugins, {
		"mhartington/formatter.nvim",
		opts = function()
			local function mix_format()
				return { exe = "mix", args = { "format", "mix.exs", "-" }, stdin = true }
			end

			local function terraform()
				return { exe = "terraform", args = { "fmt", "-write=false" }, stdin = true }
			end

			local function nix()
				return { exe = "nix", args = { "fmt" }, stdin = true }
			end

			local stylua = require("formatter.filetypes.lua").stylua
			local prettier = require("formatter.filetypes.javascript").prettier
			local black = require("formatter.filetypes.python").black
			local rustfmt = {
				exe = "rustfmt --edition 2021",
				stdin = true,
			}

			return {
				logging = true,
				filetype = {
					elixir = { mix_format },
					lua = { stylua },
					javascript = { prettier },
					javascriptreact = { prettier },
					typescript = { prettier },
					typescriptreact = { prettier },
					vue = { prettier },
					html = { prettier },
					json = { prettier },
					css = { prettier },
					scss = { prettier },
					sass = { prettier },
					python = { black },
					rust = { rustfmt },
					terraform = { terraform },
					nix = { nix },
				},
			}
		end,
		config = function(_, opts)
			require("formatter").setup(opts)

			local key_opts = { noremap = true, silent = true }
			keymap.set("n", "<leader>f", ":Format<CR> :w<CR>", key_opts)
		end,
	})

	-- toggleterm
	table.insert(plugins, {
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = [[<C-\>]],
			shade_terminals = false,
			direction = "float",
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			keymap.set("t", "<C-N>", [[<C-\><C-N>]], { noremap = true, silent = true })
		end,
	})

	-- vim test
	table.insert(plugins, {
		"vim-test/vim-test",
		config = function(_, _)
			vim.cmd([[
      let test#strategy = "toggleterm"
      ]])

			local opts = { noremap = true, silent = true }
			keymap.set("n", "t<C-n>", ":TestNearest<CR>", opts)
			keymap.set("n", "t<C-f>", ":TestFile<CR>", opts)
			keymap.set("n", "t<C-s>", ":TestSuite<CR>", opts)
			keymap.set("n", "t<C-l>", ":TestLast<CR>", opts)
			keymap.set("n", "t<C-g>", ":TestVisit<CR>", opts)
		end,
	})

	-- Mini Surround
	table.insert(plugins, {
		"echasnovski/mini.surround",
		version = false,
		opts = {
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 500,

			-- Module mappings. Use `''` (empty string) to disable ne.
			mappings = {
				add = "<leader>aa", -- Add surrunding in Normal and Visual modes
				delete = "<leader>ad", -- Delete surrounding
				find = "<leader>af", -- Find surrounding (to the right)
				find_left = "<leader>aF", -- Find surrounding (to the left)
				highlight = "<leader>ah", -- Highlight surrounding
				replace = "<leader>ar", -- Replace surrounding
				update_n_lines = "<leader>an", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			-- Number of lines within which surrounding is searched
			n_lines = 20,

			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_type = false,

			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover",

			-- Whether to disable showing non-error feedback
			silent = false,
		},
	})

	-- Vim exchange
	table.insert(plugins, { "tommcdo/vim-exchange" })
end

table.insert(plugins, {
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>n", nil, desc = "AI/Claude Code" },
			{ "<leader>nc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>nf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>nr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>nC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>nm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>nb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>ns", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>ns",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			-- Diff management
			{ "<leader>na", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>nd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
			-- Faster
			{ "<A-,>", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude", mode = { "n", "x" } },
			{ "<A-.>", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		},
		opts = {
			terminal = {
				---@module "snacks"
				---@type snacks.win.Config|{}
				snacks_win_opts = {
					position = "float",
					border = "rounded",
					width = 0.9,
					height = 0.9,
					keys = {
						claude_hide = {
							"<A-,>",
							function(self)
								self:hide()
							end,
							mode = "t",
							desc = "Hide",
						},
					},
				},
			},
			diff_opts = {
				open_in_new_tab = true,
			},
		},
})

-- LazyDev
table.insert(plugins, {
	"folke/lazydev.nvim",
	ft = "lua",
	cmd = "LazyDev",
	opts = {
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
			{ path = "LazyVim", words = { "LazyVim" } },
			{ path = "lazy.nvim", words = { "LazyVim" } },
		},
	},
})

return plugins
