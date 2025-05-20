return{
    -- tool to flag directories as 'projects' to locate them easier
    "ahmedkhalf/project.nvim",
    config=function()
        local project=require("project_nvim")
        project.setup{
            detection_methods={"pattern","lsp"},
            patterns={
                ".git",
                "_darcs",
                ".hg",
                ".bzr",
                ".svn",
                "Makefile",
                "package.json",
            },
            exclude_dirs={"~/", "~/code/srcbuilds/"},
            silent_chdir=false,
            scope_chdir="global",
            datapath=vim.fn.stdpath("data"),
        }
    end
}
