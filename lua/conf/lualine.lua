-- ~/.config/nvim/lua/lualine.lua

local colors = {
   black        = '#1e2030',
   neon         = '#232538',
   white        = '#FFFFFF',
   purple       = '#5F005F',
   blue         = '#21243e',
   darkblue     = '#ffb77c',
   navyblue     = '#1b1f52',
   brightgreen  = '#9CFFD3',
   gray         = '#1e2030',
   darkgray     = '#1e2030',
   lightgray    = '#606487',
   inactivegray = '#1e2030',
   orange       = '#FFAF00',
   red          = '#392538',
   brightorange = '#C08A20',
   brightred    = '#AF0000',
   cyan         = '#00DFFF',
   green        = '#212f38',
   lightyellow  = '#fcffbb',
}

local custom_theme = {
   normal = {
      a = { bg = colors.neon, fg = colors.lightyellow },
      b = { bg = colors.neon, fg = colors.lightyellow },
      c = { bg = colors.black, fg = colors.lightyellow },
   },
   insert = {
      a = { bg = colors.blue, fg = colors.lightyellow },
      b = { bg = colors.blue, fg = colors.lightyellow },
      c = { bg = colors.blue, fg = colors.lightyellow },
   },
   visual = {
      a = { bg = colors.green, fg = colors.lightyellow },
      b = { bg = colors.green, fg = colors.lightyellow },
      c = { bg = colors.green, fg = colors.lightyellow },
   },
   command = {
      a = { bg = colors.red, fg = colors.lightyellow },
      b = { bg = colors.red, fg = colors.lightyellow },
      c = { bg = colors.red, fg = colors.lightyellow },
   },
   inactive = {
      a = { bg = colors.neon, fg = colors.lightgray },
      b = { bg = colors.gray, fg = colors.lightgray },
      c = { bg = colors.black, fg = colors.lightgray },
   },
}

custom_theme.terminal = custom_theme.insert

require("lualine").setup({
   options = {
      disabled_filetypes = { "neo-tree" },
      theme = custom_theme, -- Use the inline custom theme
      section_separators = '',
      component_separators = '',
      globalstatus = true,
      icons_enabled = true,
   },
   sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
         function()
            local filepath = vim.fn.expand('%:p')
            filepath = filepath:gsub(vim.env.HOME, '~')
            return filepath
         end,
      },
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
