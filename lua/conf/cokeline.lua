-- local function get_directory(buffer)
--    local path = buffer.path
--    local dir = vim.fn.fnamemodify(path, ":h:t")
--    return dir
-- end

-- local function get_buffer_name(buffer)
--    local dir = get_directory(buffer)
--    local filename = buffer.filename
--    return dir .. "/" .. filename
-- end

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
            text = "",
            --    function()
            --    return vim.g.GIT_STATUS or ""
            -- end,
            fg = '#dccd00',
            bg = '#1e2030',
         },
      },
   },
   components = {
      {
         text = function(buffer) return ' ' .. buffer.devicon.icon or ' ' end,
         fg = function(buffer) return buffer.devicon.color or (buffer.is_focused and '#dccd00' or '#888888') end,
         bg = function(buffer) return buffer.is_modified and '#473131' or '#1e2030' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },
      {
         text = function(buffer) return buffer.unique_prefix end,
         fg = function(buffer) return buffer.is_focused and '#dccd00' or '#888888' end,
         bg = function(buffer) return buffer.is_modified and '#473131' or '#1e2030' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },
      {
         text = function(buffer) return '' .. buffer.filename .. '' end,
         fg = function(buffer) return buffer.is_focused and '#dccd00' or '#888888' end,
         bg = function(buffer) return buffer.is_modified and '#473131' or '#1e2030' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },
      {
         text = function(buffer) return buffer.is_focused and ' ' or ' ' end,
         fg = function(buffer) return buffer.is_focused and '#dccd00' or '#888888' end,
         bg = function(buffer) return buffer.is_modified and '#473131' or '#1e2030' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },

   },
})

require("lualine").setup({
   options = {
      disabled_filetypes = {
         "neo-tree" -- Disable Lualine for Neotree
      },
      theme = "powerline_dark_2",
      section_separators = '',
      component_separators = '',
      globalstatus = true, -- If you want a global status line
      icons_enabled = true,
   },
   sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
         function()
            local filepath = vim.fn.expand('%:p')       -- Get absolute path
            filepath = filepath:gsub(vim.env.HOME, '~') -- Replace $HOME with ~
            return filepath
         end, },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
   },
   winbar = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
   },

   inactive_winbar = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
   },
})
