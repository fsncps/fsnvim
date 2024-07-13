return {
   "AckslD/nvim-neoclip.lua",
   requires = {
      { "nvim-telescope/telescope.nvim" },
      { "kkharji/sqlite.lua" }, -- Ensure this matches the directory structure
   },
   config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
   end,
}
