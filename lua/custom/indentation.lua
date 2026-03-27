local two_space_fts = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'json' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = two_space_fts,
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    if not vim.tbl_contains(two_space_fts, vim.bo.filetype) then
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
      vim.bo.softtabstop = 4
      vim.bo.expandtab = true
    end
  end,
})
