return {
  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function(_, opts)
      require("hop").setup(opts)
    end,
  },
}
