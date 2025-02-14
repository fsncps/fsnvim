return {
   "tpope/vim-dadbod",
   dependencies = {
      "kristijanhusak/vim-dadbod-ui",
<<<<<<< HEAD
      "kristijanhusak/vim-dadbod-completion"
   },
   cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection" },
   keys = { { "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DB UI" } }
=======
      "kristijanhusak/vim-dadbod-completion",
   },
   config = function()
      vim.g.db_ui_auto_execute_table_helpers = 1
   end,
   cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
>>>>>>> d06ecc7d64874b4372873a889557a3dc5ad6f4f6
}
