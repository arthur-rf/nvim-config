require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
  },
})

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)
