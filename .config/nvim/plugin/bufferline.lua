local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end

bufferline.setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    offsets = {
      { filetype = "oil", text = "Oil", text_align = "left" },
    },
  },
})
