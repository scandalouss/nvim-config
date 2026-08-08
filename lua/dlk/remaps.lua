vim.g.mapleader = " "
local map = vim.keymap.set

-------------------------------
---|||NON-PLUGIN BINDINGS|||---
-------------------------------

--- move up and down by 6
map({"n", "v"}, "J", "6j")
map({"n", "v"}, "K", "6k")

--get rid of that god awful terminal mode insert escape sequence bullshit
map('t', '<esc>', [[<C-\><C-n>]], { silent = true })

--- lsp stuff
map({"n", "i"}, "<C-k>", "<CMD>lua vim.lsp.buf.hover()<CR>")

--- toggle netrw
-- map("n", "<leader>e", "<CMD>Lex<CR>")
-- map("n", "<leader>fe", "<CMD>Ex<CR>" )

--- making splits
map("n", "<leader>x", "<CMD>split<CR>")
map("n", "<leader>v", "<CMD>vsplit<CR>")

--- mapping to make tab autocomplete
--- ctrl-y still works, but i like tab too
map('i', '<Tab>', [[pumvisible() ? '<C-y>' : '<Tab>']], {expr = true, noremap = true})

--- plugin stuff
map("n", "<leader>U", "<CMD>lua vim.pack.update()<CR>")                             --update plugins
map("n", "<leader>P", "<CMD>lua vim.pack.update(nil, {offline = true})<CR>")        --view plugins without updating

--- quick config reload
map("n", "<leader>rl", ":so $MYVIMRC<CR>")

--- buffer stuff
map("n", "<leader>bd", ":bp | sp | bn | bd<CR>")                                    --move to previous buffer and delete the one we just moved from
map("n", "<leader>bw", ":%bd|e#|bd#<CR>")                                           --close all buffers but the current

--- navigating splits
--map("n", "<C-Left>", "<C-w>h")
--map("n", "<C-Right>", "<C-w>l")
--map("n", "<C-Up>", "<C-w>k")
--map("n", "<C-Down>", "<C-w>j")

--- resizing splits
--map("n", "<C-M-e>", ":resize +2<CR>")
--map("n", "<C-M-d>", ":resize -2<CR>")
--map("n", "<C-M-s>", ":vertical resize -2<CR>")
--map("n", "<C-M-f>", ":vertical resize +2<CR>")

---------------------------
---|||PLUGIN BINDINGS|||---
---------------------------

--- smart-splits bindings
local splits = require("smart-splits")
splits.setup()
map('n', '<C-M-s>', splits.resize_left)
map('n', '<C-M-d>', splits.resize_down)
map('n', '<C-M-e>', splits.resize_up)
map('n', '<C-M-f>', splits.resize_right)
--moving between splits
map('n', '<C-Left>', splits.move_cursor_left)
map('n', '<C-Down>', splits.move_cursor_down)
map('n', '<C-Up>', splits.move_cursor_up)
map('n', '<C-Right>', splits.move_cursor_right)
map('n', '<C-\\>', splits.move_cursor_previous)
--swapping buffers between windows
map('n', '<leader>F', splits.swap_buf_left)
map('n', '<leader>J', splits.swap_buf_down)
map('n', '<leader>K', splits.swap_buf_up)
map('n', '<leader>B', splits.swap_buf_right)

--- oil.nvim bindings
map('n', '<leader>e', "<CMD>Oil<CR>")

--conjure bindings
vim.g["conjure#mapping#doc_word"] = false --turn off K word highlighting
map('n', '<F2>', "<CMD>ConjureEval<CR>")
map('n', '<F3>', "<CMD>ConjureEvalBuf<CR>")
map('n', '<F4>', "<CMD>ConjureEvalFile<CR>")

--- mini bindings
map("n","<leader>pf","<CMD>Pick files<CR>")
map("n","<leader>pg","<CMD>Pick grep_live<CR>")
map("n","<leader>pb","<CMD>Pick buffers<CR>")
map("n","<leader>ph","<CMD>Pick help<CR>")
map("n","<leader>pp","<CMD>Pick projects<CR>")
map("n","<leader>pm","<CMD>lua MiniExtra.pickers.marks{scope = 'global'}<CR>")
map("n","<leader>pk","<CMD>Pick keymaps<CR>")
--special zoom function to preserve background with mini.misc zoom function
local my_zoom = function()
  MiniMisc.zoom()
  -- Differentiate between zooming in (floating window) and zooming out (not floating window)
  -- This is not 100% solution, but should work for 99% of cases
  if vim.api.nvim_win_get_config(0).relative == '' then return end
  vim.wo.winhighlight = 'NormalFloat:Normal'
end
vim.keymap.set('n', '<Leader>z', my_zoom, { desc = 'Zoom' })

--- trouble
map("n", "<leader>w", "<CMD>Trouble toggle diagnostics<CR>")

--- neogit bindings
map("n", "<leader>go", "<CMD>Neogit kind=floating<CR>")
map("n", "<leader>gc", "<CMD>Neogit commit<CR>")
map("n", "<leader>gm", "<CMD>Neogit merge<CR>")
map("n", "<leader>gb", "<CMD>Neogit branch<CR>")
map("n", "<leader>gp", "<CMD>Neogit push<CR>")
map("n", "<leader>gP", "<CMD>Neogit pull<CR>")
map("n", "<leader>gf", "<CMD>Neogit fetch<CR>")
map("n", "<leader>gr", "<CMD>Neogit rebase<CR>")
map("n", "<leader>gR", "<CMD>Neogit reset<CR>")
map("n", "<leader>gB", "<CMD>Neogit revert<CR>")
map("n", "<leader>gl", "<CMD>Neogit log<CR>")

--- overseer bindings
map("n","<F5>","<CMD>OverseerShell<CR>")
map("n","<F6>","<CMD>OverseerRestartLast<CR>")
map("n","<F7>","<CMD>OverseerRun<CR>")
map("n","<F8>","<CMD>OverseerToggle<CR>")
-- map("n","<F13>","<CMD>OverseerTaskAction<CR>")

--fidget bindings
map("n","<leader>nc", "<CMD>Fidget clear<CR>")
map("n","<leader>nh", "<CMD>Fidget history<CR>")

--- undotree
map("n", "<leader>ut", "<CMD>Undotree<CR>")
map("n", "<leader>ul", "<CMD>undolist<CR>")

--nvim-dap and dap-ui bindings
local dap = require("dap")
local function dapquit()
    -- dap.close()
    require("dapui").close()
    dap.terminate()
    dap.disconnect()
end
map("n","<leader>dq",dapquit)
map("n","<leader>db",dap.toggle_breakpoint)
map("n","<leader>de",dap.set_exception_breakpoints)
map("n","<F9>",dap.continue)
map("n","<F10>",dap.step_over)
-- map("n","<leader>dj",dap.step_back)
map("n","<F11>",dap.step_into)
map("n","<F12>",dap.step_out)
map("n","<leader>dl","<CMD>DapShowLog<CR>")
