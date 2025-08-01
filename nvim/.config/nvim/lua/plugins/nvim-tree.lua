return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup{}
    vim.keymap.set('n', '<F3>', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
  end
}
