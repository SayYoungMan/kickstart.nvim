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

-- Copy all lines of current file
vim.keymap.set('n', '<leader>ca', 'ggyG', { desc = '[C]opy [A]ll' })

-- Move lines up/down (VS Code style: Option+Up/Down)
vim.keymap.set('n', '<M-k>', '<cmd>move .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('n', '<M-j>', '<cmd>move .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('v', '<M-k>', ":move '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<M-j>', ":move '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- Ctrl+d, Ctrl+u moves half page up/down but always centres screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move half screen down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move half screen up' })

-- Open Undo Tree
vim.cmd 'packadd nvim.undotree'
vim.keymap.set('n', '<leader>ou', require('undotree').open, { desc = '[O]pen [U]ndotree' })

-- Toggle comment on g/ instead of the built-in gc
vim.keymap.set({ 'n', 'x' }, 'g/', function()
  return require('vim._comment').operator()
end, { expr = true, desc = 'Toggle comment' })
vim.keymap.del({ 'n', 'x' }, 'gc')

-- g// toggles the current line (replaces gcc)
vim.keymap.set('n', 'g//', function()
  return require('vim._comment').operator() .. '_'
end, { expr = true, desc = 'Toggle comment line' })
vim.keymap.del('n', 'gcc')

-- Comment textobject, e.g. dg/ deletes a comment block, g/g/ toggles one
vim.keymap.set('o', 'g/', function()
  require('vim._comment').textobject()
end, { desc = 'Comment textobject' })
vim.keymap.del('o', 'gc')
