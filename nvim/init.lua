vim.g.mapleader = " "

vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 16
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.hlsearch = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'stevearc/oil.nvim',
		opts = {},
		config = function()
            require('oil').setup({
                default_file_explorer = true;

                vim.keymap.set("n", "-", "<CMD>Oil<CR>")
            })
        end
    },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "vim", "java" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	}
})

-- Colorscheme
local black = "#191724"
local white = "#e0def4"
local gray = "#6e6a86"
local red = "#eb6f92"

vim.api.nvim_set_hl(0, "Normal", { fg = white })
vim.api.nvim_set_hl(0, "Comment", { fg = gray })

vim.api.nvim_set_hl(0, "Boolean", { fg = red })
vim.api.nvim_set_hl(0, "Number", { fg = red })
vim.api.nvim_set_hl(0, "String", { fg = white })

vim.api.nvim_set_hl(0, "LineNr", { fg = white})
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#26233a" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = gray })

vim.api.nvim_set_hl(0, "StatusLine", { fg = gray })
