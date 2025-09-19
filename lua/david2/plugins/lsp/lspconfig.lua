return{
	"mason-org/mason-lspconfig.nvim",
	dependencies={
		"neovim/nvim-lspconfig",
		{"mason-org/mason.nvim", opts={}},
	},
    lazy=true,
    event="VeryLazy",
	config=function()
		local masonlsp=require("mason-lspconfig")
		masonlsp.setup{
			ensure_installed={},
		}
	end
}
