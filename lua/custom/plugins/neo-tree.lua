return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
      { '<leader>tt', '<cmd>Neotree toggle<CR>', desc = '[T]oggle [T]ree' },
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
      },
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<space>'] = 'none',
        },
      },
    },
  },
}
