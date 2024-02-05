local wk = require("which-key")
local tels = require("telescope.builtin")

-- vim keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCyclePrev<cr>", opts)
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCycleNext<cr>", opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "-", ":split<CR>", opts)
vim.keymap.set("n", "|", ":vsplit<CR>", opts)

-- lsp vim keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- which key mappings
-- n
local normal_mappings = {

	-- AI
	["<leader>a"] = {
		-- gen nvim (ollama)
		name = "AI",
		o = { ":Gen<CR>", "Ollama Gen" },
	},

	-- buffers
	["<leader>b"] = {
		name = "buffers",
		p = { "<Cmd>BufferLineTogglePin<CR>", "Toggle pin" },
	},

	-- explorer
	["<leader>e"] = { ":Neotree filesystem reveal left<CR>", "Explorer" },

	-- telescope
	["<leader>f"] = {
		name = "Find",
		f = { tels.find_files, "Find Files" },
		g = { tels.git_files, "Find Git Files" },
		k = { tels.keymaps, "Find Keymaps" },
		h = { tels.help_tags, "Find Help Tags" },
		l = { tels.live_grep, "Live Grep" },
		b = { tels.buffers, "Find Buffers" },
		j = {
			function()
				require("flash").jump()
			end,
			"Flash Jump",
		},
		t = {
			function()
				require("flash").treesitter()
			end,
			"Flash Treesitter",
		},
		T = {
			function()
				require("flash").treesitter_search()
			end,
			"Flash Treesitter Search",
		},
	},

	-- lsp
	["<leader>l"] = {
		name = "LSP",
		d = { vim.lsp.buf.definition, "Code Definition" },
		r = { vim.lsp.buf.references, "Code Reference" },
		a = { vim.lsp.buf.code_action, "Code Action" },
		f = { vim.lsp.buf.format, "Code Format" },
		t = {
			function()
				require("trouble").toggle()
			end,
			"Trouble Toggle",
		},
		q = {
			function()
				require("trouble").toggle("quickfix")
			end,
			"Quick Fix",
		},
		R = {
			function()
				require("trouble").toggle("lsp_references")
			end,
			"Trouble LSP Refs",
		},
		w = {
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			"Document Diag",
		},
		W = {
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			"Workspace Diag",
		},
	},

	-- shortcuts
	["<leader>s"] = {
		name = "shortcuts",
		r = { ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", "Replace All" },
		R = { ":%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>", "Confirm Replace All" },
	},

	-- tabs
	["<leader>t"] = {
		name = "Tabs",
		e = { ":tabedit", "Tab Edit" },
		c = { ":tabclose", "Tab Close" },
		n = { ":tabnext<CR>", "Next Tab" },
		N = { ":tabprev<CR>", "Prev Tab" },
	},

	-- xtra
	["<leader>x"] = {
		name = "Xtra",
		t = { "<cmd>TodoTelescope<cr>", "Todo" },
		T = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme" },
		n = { ":NoiceLast<CR>", "Noice Last Message" },
		N = { ":NoiceTelescope<CR>", "Noice History" },
		l = { ":Lazy<CR>", "Lazy" },
		m = { ":Mason<CR>", "Mason" },
	},
}

-- v
local visual_mappings = {}

-- i
local insert_mappings = {}

-- registering
-- normal mappings register
wk.register(normal_mappings, {
	mode = "n", -- NORMAL mode
	silent = true,
	noremap = true,
})

-- visual mappings register
wk.register(visual_mappings, {
	mode = "n", -- NORMAL mode
	silent = true,
	noremap = true,
})

-- insert mappings register
wk.register(insert_mappings, {
	mode = "n", -- NORMAL mode
	silent = true,
	noremap = true,
})
