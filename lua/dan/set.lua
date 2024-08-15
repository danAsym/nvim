local opt = vim.opt

-- Tab/identation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.scrolloff = 8
opt.cursorline = true
opt.guicursor = "i:ver25-iCursor"
opt.completeopt = "menuone,noinsert,noselect"
opt.fillchars = { eob = " " }

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.isfname:append("@-@")
opt.updatetime = 50
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.mouse = "a" -- enable mouse support

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#ffffff", bg = "NONE" })
