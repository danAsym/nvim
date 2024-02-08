return {

	-- which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		name = "which-key",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	--trouble
	{
		"folke/trouble.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { use_diagnostic_signs = true },
	},

	-- todo
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		config = true,
		lazy = false,
	},

	-- flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		opts = {},
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- vim illuminate (instance of words highlight)
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},

	-- mini pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},

	-- mini surround
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "gsa", -- Add surrounding in Normal and Visual modes
					delete = "gsd", -- Delete surrounding
					find = "gsf", -- Find surrounding (to the right)
					find_left = "gsF", -- Find surrounding (to the left)
					highlight = "gsh", -- Highlight surrounding
					replace = "gsr", -- Replace surrounding
					update_n_lines = "gsn", -- Update `n_lines`
				},
			})
		end,
	},

	-- aerial
	{
		"stevearc/aerial.nvim",
		event = "VeryLazy",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				layout = {
					min_width = 35,
				},
				highlight_on_jump = 0,
				close_on_select = true,
				show_guides = true,
			})
		end,
	},

	-- mini buf remove
	{
		"echasnovski/mini.bufremove",
		event = "VeryLazy",
		config = function()
			require("mini.bufremove").setup()
		end,
	},
}
