return {
   "akinsho/bufferline.nvim",
   requires = "nvim-tree/nvim-web-devicons",
   config = function()
      require("bufferline").setup({
         options = {
            numbers = "buffer_id",
            diagnostics = "nvim_lsp",
            offsets = { { filetype = "neo-tree", text = "File Explorer", text_align = "left" } },
         },
      })
   end,
}
