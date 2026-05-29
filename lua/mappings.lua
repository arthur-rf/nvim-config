require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })
-- telescope
map("n", "<Leader>ft", "<cmd>Telescope lsp_document_symbols<CR>",          { desc = "Find document symbols" })
map("n", "<Leader>fT", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Find workspace symbols" })
map("n", "<Leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<CR>",  { desc = "Debug hover variable" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>",       { desc = "Toggle debug REPL" })
map("n", "<Leader>dv", "<cmd>lua require'dapui'.eval()<CR>",            { desc = "Eval under cursor" })
map("v", "<Leader>dvs", "<cmd>lua require'dapui'.eval()<CR>",            { desc = "Eval selection" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })
