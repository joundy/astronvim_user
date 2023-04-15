return {
  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function(_, opts)
      require("hop").setup(opts)
    end,
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "mcchrish/zenbones.nvim", name = "zenbones", lazy = false, priority = 1000 },
  { "Shatur/neovim-ayu", name = "ayu", lazy = false, priority = 1000 },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
}
