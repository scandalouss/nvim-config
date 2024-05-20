require("project_nvim").setup{
    manual_mode=false,
    detection_methods={"lsp","pattern",},
    patterns={
        ".git",
        "Cargo.toml",
        "pubspec.yaml",
        "CMakeLists.txt",
        "build.zig",
        ".vscode",
        ".svn",
        "Makefile",
        "package.json",
    },
    datapath=vim.fn.stdpath "data",
}
