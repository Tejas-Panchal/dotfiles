require('oil').setup({
  columns = { "icon" },
})

vim.keymap.set("n", "<leader>fo", "<CMD>Oil<CR>", { desc = "Open parent directory" })
