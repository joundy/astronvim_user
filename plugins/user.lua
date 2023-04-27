return {
  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function(_, opts) require("hop").setup(opts) end,
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "mcchrish/zenbones.nvim",     name = "zenbones", lazy = false, priority = 1000 },
  { "Shatur/neovim-ayu",          name = "ayu",      lazy = false, priority = 1000 },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        filters = {
          dotfiles = false,
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          adaptive_size = false,
          float = {
            enable = true,
            open_win_config = {
              width = 60,
              height = 40,
            },
          },
        },
        git = {
          enable = true,
          ignore = false,
        },
      }
    end,
  },
}
