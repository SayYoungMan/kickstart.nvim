local function toggle_or_swap(source)
  local state = require('neo-tree.sources.manager').get_state(source)
  local renderer = require 'neo-tree.ui.renderer'
  if state and renderer.window_exists(state) then
    vim.cmd 'Neotree close'
  else
    vim.cmd('Neotree focus ' .. source)
  end
end

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
      {
        '<leader>ot',
        function() toggle_or_swap 'filesystem' end,
        desc = '[O]pen [T]ree (filesystem)',
      },
      {
        '<leader>og',
        function() toggle_or_swap 'git_status' end,
        desc = '[O]pen [G]it changes tree',
      },
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = true,
          never_show = { '.git' },
        },
      },
      window = {
        width = 27,
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<space>'] = 'none',
        },
      },
    },
  },
}
