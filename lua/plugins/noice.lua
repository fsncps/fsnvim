return {
   {
      "rcarriga/nvim-notify",
      lazy = false, -- **Load early so Noice can use it**
   },
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
         "MunifTanjim/nui.nvim",
         "rcarriga/nvim-notify",
      },
   },
}
