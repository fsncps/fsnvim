return {
   "tpope/vim-dadbod",
   dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
   },
   config = function()
      vim.g.db_ui_auto_execute_table_helpers = 1
   end,
   cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
}
