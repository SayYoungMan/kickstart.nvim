-- Copy diagnostic message on current line to clipboard
vim.keymap.set('n', '<leader>ce', function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line '.' - 1 })
  if #diagnostics == 0 then
    vim.notify('No diagnostics on current line', vim.log.levels.INFO)
    return
  end
  local messages = {}
  for _, d in ipairs(diagnostics) do
    table.insert(messages, d.message)
  end
  local result = table.concat(messages, '\n')
  vim.fn.setreg('+', result)
  vim.notify('Copied: ' .. result, vim.log.levels.INFO)
end, { desc = '[C]opy [E]rror message' })

-- Move lines up/down (VS Code style: Option+Up/Down)
vim.keymap.set('n', '<M-k>', '<cmd>move .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('n', '<M-j>', '<cmd>move .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('v', '<M-k>', ":move '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<M-j>', ":move '>+1<CR>gv=gv", { desc = 'Move selection down' })
