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
   
  { "f-person/git-blame.nvim",
    event = "VeryLazy",
      opts = {
      enabled = true,  -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
    },
  },
}
