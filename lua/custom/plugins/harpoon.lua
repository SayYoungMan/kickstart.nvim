return {
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set('n', '<leader>a', require('harpoon.mark').add_file, { desc = '[A]dd to Harpoon' })

      local ui = require 'harpoon.ui'
      vim.keymap.set('n', '<leader>oh', ui.toggle_quick_menu, { desc = '[O]pen [H]arpoon' })
      vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, { desc = 'which_key_ignore' })
      vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, { desc = 'which_key_ignore' })
      vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, { desc = 'which_key_ignore' })
      vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, { desc = 'which_key_ignore' })
    end,
  },
}
