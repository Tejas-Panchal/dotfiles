local ok, dooing = pcall(require, 'dooing')
if not ok then
  return
end

dooing.setup({
  window = {
    height = 15,
    border = "single",
  },
})

vim.keymap.set("n", "<leader>td", "<CMD>Dooing<CR>",     { desc = "Toggle global todos" })
vim.keymap.set("n", "<leader>tD", "<CMD>DooingLocal<CR>", { desc = "Toggle project todos" })
vim.keymap.set("n", "<leader>tN", "<CMD>DooingDue<CR>",   { desc = "Show due items" })
