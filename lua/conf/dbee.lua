require("dbee").setup({
   sources = {
      require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
   }
})
