-- Copyright (c) 2021 Ashish Panigrahi
-- MIT license, see LICENSE for more details.
-- stylua: ignore
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

local M = {
   normal = {
      a = { bg = colors.neon, fg = colors.lightyellow },
      b = { bg = colors.neon, fg = colors.lightyellow },
      c = { bg = colors.black, fg = colors.lightyellow },

   },
   insert = {
      a = { bg = colors.blue, fg = colors.ligtyellow },
      b = { bg = colors.blue, fg = colors.ligtyellow },
      c = { bg = colors.blue, fg = colors.ligtyellow },
   },
   visual = {
      a = { bg = colors.green, fg = colors.ligtyellow },
      b = { bg = colors.green, fg = colors.ligtyellow },
      c = { bg = colors.green, fg = colors.ligtyellow },
   },
   command = {
      a = { bg = colors.red, fg = colors.ligtyellow },
      b = { bg = colors.red, fg = colors.ligtyellow },
      c = { bg = colors.red, fg = colors.ligtyellow },
   },
   inactive = {
      a = { bg = colors.neon, fg = colors.lightgray },
      b = { bg = colors.gray, fg = colors.lightgray },
      c = { bg = colors.black, fg = colors.lightgray },
   },
}

M.terminal = M.insert

return M
