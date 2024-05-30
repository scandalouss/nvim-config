require("project_nvim").setup{
    manual_mode=false,
    detection_methods={"pattern"},
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
    silent_chdir=false,
    datapath=vim.fn.stdpath "data",
}
