local ok, treesitter = pcall(require, 'nvim-treesitter')
if not ok then
  return
end

treesitter.setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}

treesitter.install({ 'lua', 'vim', 'vimdoc', 'go' }):wait(60000)

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'vim', 'go' },
  callback = function() vim.treesitter.start() end,
})
