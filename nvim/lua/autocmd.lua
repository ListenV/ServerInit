-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("my_group", {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})
