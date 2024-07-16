require('cokeline').setup({
   buffers = {
      filter_valid = function(buffer)
         return buffer.type ~= 'terminal'
      end,
   },
   sidebar = {
      filetype = 'neo-tree',
      components = {
         {
            text = vim.g.GIT_STATUS,
            --text = require("fnct.last_commit").Last_Commit(vim.api.nvim_buf_get_name(0)),
            fg = '#1e2030',
            bg = '#1e2030',
         },
      },
   },
   components = {
      {
         text = '|',
         bg = '#24273a',
      },
      {
         text = function(buffer) return buffer.devicon.icon or '' end,
         fg = function(buffer) return buffer.devicon.color or (buffer.is_focused and '#00ff00' or '#888888') end,
         bg = function(buffer) return buffer.is_modified and '#472929' or '#24273a' end,
      },
      {
         text = function(buffer) return '' .. (buffer.filename ~= '' and buffer.filename or '[No Name]') .. '' end,
         fg = function(buffer) return buffer.is_focused and '#72ad24' or '#888888' end,
         bg = function(buffer) return buffer.is_modified and '#472929' or '#24273a' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },
      {
         text = '|',
         bg = '#24273a',
      },
   },
})
