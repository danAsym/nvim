local wk = require("which-key")
local tels = require("telescope.builtin")

-- vim keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Tab>", ">>", opts)
vim.keymap.set("n", "<S-Tab>", "<<", opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)

-- lsp vim keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- which key mappings
-- n
local normal_mappings = {
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
	},

	-- lsp
	["<leader>l"] = {
		name = "LSP",
		d = { vim.lsp.buf.definition, "Code Definition" },
		a = { vim.lsp.buf.code_action, "Code Action" },
		f = { vim.lsp.buf.format, "Code Format" },
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
