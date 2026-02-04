return{
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
        local session = require("session_manager")
        local util = require("session_manager.config")
        session.setup{
            autoload_mode = util.AutoloadMode.CurrentDir,
            autosave_only_in_session = true
        }
    end
}
