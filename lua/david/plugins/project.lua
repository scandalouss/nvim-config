return{
    "ahmedkhalf/project.nvim",
    config=function()
        local project=require("project_nvim")
        project.setup{
            detection_methods={"lsp", "pattern"},
            patterns={".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json"},
            exclude_dirs={"~/", "~/Documents/*"},
            silent_chdir=false,
            scope_chdir="global",
            datapath=vim.fn.stdpath("data"),
        }
    end
}
