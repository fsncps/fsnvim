return {
   "tpope/vim-dadbod",
   dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion"
   },
   cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection" },
   keys = { { "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DB UI" } }
}
