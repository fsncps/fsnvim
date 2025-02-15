local notify = require("notify")

notify.setup({
   stages = "fade_in_slide_out",
   timeout = 3000,
   background_colour = "Normal",
   fps = 30,
   render = "wrapped-compact",
   top_down = false, -- **Ensure notifications appear at the bottom**
})

vim.notify = notify -- **Set notify as the default notification handler**

require("noice").setup({
   cmdline = {
      enabled = true,
      view = "cmdline",
      format = {
         cmdline = { pattern = "^:", icon = "", lang = "vim" },
         search_down = { pattern = "^/", icon = " ", lang = "regex" },
         search_up = { pattern = "^%?", icon = " ", lang = "regex" },
         filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
         lua = false,
         help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      },
   },
   messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = false,
   },
   views = {
      notify = {
         backend = "notify",
         replace = true,
         merge = true,
         anchor = "bottomright", -- **Bottom-right placement**
         timeout = 3000,
         position = {
            row = "100%", -- **Bottom**
            col = "100%", -- **Right**
         },
      },
   },
   popupmenu = {
      enabled = true,
      backend = "nui",
   },
   notify = {
      enabled = true,
      view = "notify",
   },
   lsp = {
      progress = {
         enabled = true,
         format = "lsp_progress",
         format_done = "lsp_progress_done",
         throttle = 1000 / 30,
         view = "mini",
      },
      override = {
         ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
         ["vim.lsp.util.stylize_markdown"] = false,
         ["cmp.entry.get_documentation"] = false,
      },
      hover = { enabled = true, silent = true },
      signature = {
         enabled = true,
         auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
         },
      },
      message = {
         enabled = true,
         view = "notify",
      },
      documentation = {
         view = "hover",
         opts = {
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            win_options = { concealcursor = "n", conceallevel = 3 },
         },
      },
   },
   presets = {
      bottom_search = true,
      command_palette = false,
      long_message_to_split = false,
      inc_rename = false,
      lsp_doc_border = false,
   },
   throttle = 1000 / 30,
})
