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
    {"nvim-tree/nvim-tree.lua", dependencies={"nvim-tree/nvim-web-devicons"}},
	--lsp/mason
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"VonHeikemen/lsp-zero.nvim",
	--autocomplete
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
    --fuzzyfinder
    {"nvim-telescope/telescope.nvim", dependencies={"nvim-lua/plenary.nvim","nvim-telescope/telescope-file-browser.nvim"}},
    --splash screen
    "goolord/alpha-nvim",
    --bottom status bar
    "nvim-lualine/lualine.nvim",
    --top buffer bar
    "akinsho/bufferline.nvim",
    --autopairs
    {"echasnovski/mini.pairs",version=false},
    --sidebar map
    {"echasnovski/mini.map",version=false, lazy=true},
    --notifications
    {"echasnovski/mini.notify",version=false},
    --animations
    {"echasnovski/mini.animate",version=false},
    --highlight color patterns
    {"echasnovski/mini.hipatterns",version=false, lazy=true},
    --status column
    "luukvbaal/statuscol.nvim",
    --folding lines/indent lines
    {"kevinhwang91/nvim-ufo", lazy=true, dependencies={"kevinhwang91/promise-async"}},
    {"lukas-reineke/indent-blankline.nvim", lazy=true},
    --diagnostics
    {"folke/trouble.nvim", lazy=true},
    --debugger
    {"rcarriga/nvim-dap-ui", lazy=true, dependencies={"mfussenegger/nvim-dap","nvim-neotest/nvim-nio"}},
    "jay-babu/mason-nvim-dap.nvim",
    --easy compiler
    {"stevearc/overseer.nvim", lazy=true},
    --project management
    "ahmedkhalf/project.nvim",
    --gentoo highlights
    {"gentoo/gentoo-syntax", lazy=true},
    --colorcolumn to keep me at 80 lines
    "m4xshen/smartcolumn.nvim",
    --theprimeagen's vim games to make me better at this shit
    {"ThePrimeagen/vim-be-good", lazy=true},
    --gruvbox theme for laptop
    {"ellisonleao/gruvbox.nvim", lazy=true},
})
