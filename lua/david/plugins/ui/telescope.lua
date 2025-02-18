-- the best fuzzy finder
return{
    "nvim-telescope/telescope.nvim",
    dependencies={
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    event="VeryLazy",
    config=function()
        local telescope=require("telescope")
        local actions=require("telescope.actions")
        telescope.setup{
            defaults={
                initial_mode="normal"
            },
            pickers={
                marks={
                    attach_mappings = function(_, map)
                        map({"i", "n"}, "<c-b>", require("telescope.actions").delete_mark)
                        return true
                    end,
                },
                buffers={
                    sort_lastused=true,
                    mappings={
                        i={
                            ["<c-d>"]=actions.delete_buffer,
                        },
                        n={
                            ["<c-d>"]=actions.delete_buffer,
                        },
                    }
                }
            }
        }
        telescope.load_extension("projects")
    end
}
