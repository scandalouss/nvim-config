--init lazy.vim
local lazypath=vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--plugins go down here
require("lazy").setup({
	--treesitter
	{"nvim-treesitter/nvim-treesitter",build=":TSUpdate"},
	--file explorer
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	--lsp/mason
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"VonHeikemen/lsp-zero.nvim",
	--autocomplete
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
    --fuzzyfinder
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    --splash screen
    "goolord/alpha-nvim",
    --bottom status bar
    "nvim-lualine/lualine.nvim",
    --top buffer bar
    "akinsho/bufferline.nvim",
    --autopairs
    {"echasnovski/mini.pairs",version=false},
    --sidebar map
    {"echasnovski/mini.map",version=false},
    --notifications
    {"echasnovski/mini.notify",version=false},
    --animations
    {"echasnovski/mini.animate",version=false},
    --highlight color patterns
    {"echasnovski/mini.hipatterns",version=false},
    --status column
    "luukvbaal/statuscol.nvim",
    --folding lines/indent lines
    "kevinhwang91/nvim-ufo",
    "kevinhwang91/promise-async",
    "lukas-reineke/indent-blankline.nvim",
    --diagnostics
    "folke/trouble.nvim",
    --debugger
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    --easy compiler
    "stevearc/overseer.nvim",
    "Cliffback/compiler.nvim",
    --project management
    "ahmedkhalf/project.nvim",
    --gentoo highlights
    "gentoo/gentoo-syntax",
})
