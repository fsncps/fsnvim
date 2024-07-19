local function get_directory(buffer)
   local path = buffer.path
   local dir = vim.fn.fnamemodify(path, ":h:t")
   return dir
end

local function get_buffer_name(buffer)
   local dir = get_directory(buffer)
   local filename = buffer.filename
   return dir .. "/" .. filename
end

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
            text = function()
               return vim.g.GIT_STATUS or ""
            end,
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
         text = function(buffer) return '' .. get_buffer_name(buffer) .. '' end,
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
