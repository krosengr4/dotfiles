return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter',
    opts = {
      ensure_installed = { 'html', 'css' },
      highlight = { enable = true },
    },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'xml', 'jsx', 'tsx', 'vue', 'svelte' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
}
