Vim�UnDo� ��G2?Γ����Ivt�!�j��b��]��}I��   2   ;      init_popup_term()   -- Initialize if not already done   %                           f���    _�                     $        ����                                                                                                                                                                                                                                                                                                                            0          $           v        f���    �   #              :-- local isPopupVisible = false -- State tracking variable   --   -- function Toggle_Terminal()   --    if not TermPopup then   <--       Init_Popup_Term() -- Initialize if not already done    --    elseif isPopupVisible then   --       TermPopup:hide()   --       isPopupVisible = false   
--    else   --       TermPopup:show()   --       isPopupVisible = true   	--    end   -- end5��    #                           e      ?      5�_�                            ����                                                                                                                                                                                                                                                                                                                            0                     v        f��(     �                   �               �               0    TermPopup = require("nui.popup")       function Init_Popup_Term()      local popup_width = 90      local popup_height = 20   #   local total_cols = vim.o.columns   "   local total_lines = vim.o.lines          TermPopup = TermPopup({         enter = true,         focusable = true,         border = {            style = "rounded",   #         highlight = "FloatBorder",         },         position = {   .         row = total_lines - popup_height - 5,   ,         col = total_cols - popup_width + 5,         },         size = {            width = popup_width,            height = popup_height,         },      })          TermPopup:mount()       E   -- Start a terminal session inside the popup and enter insert mode   #   vim.api.nvim_command('terminal')      vim.cmd('startinsert')           -- Hide the popup immediately      TermPopup:hide()   end       7local isPopupVisible = false -- State tracking variable       function Toggle_Terminal()      if not TermPopup then   9      Init_Popup_Term() -- Initialize if not already done      elseif isPopupVisible then         TermPopup:hide()         isPopupVisible = false      else         TermPopup:show()         isPopupVisible = true      end   end5��            /                      C              �                    2                       �      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        f���     �         3      function Init_Popup_Term()5��                          �                      5�_�                    #        ����                                                                                                                                                                                                                                                                                                                                                 v        f���     �   "   $   3      function Toggle_Terminal()5��    "                      P                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        f���     �         3       local function Init_Popup_Term()5��                        �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        f���     �         3       local function init_Popup_Term()5��                        �                     5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                 v        f���     �         3       local function init_popup_Term()5��                        �                     5�_�      
           	   #       ����                                                                                                                                                                                                                                                                                                                                                 v        f���     �   "   $   3       local function Toggle_Terminal()5��    "                    _                    5�_�   	              
   #       ����                                                                                                                                                                                                                                                                                                                                                 v        f���     �   "   $   3       local function toggle_Terminal()5��    "                    f                    5�_�   
                 1       ����                                                                                                                                                                                                                                                                                                                                                 v        f���     �   0   2   3      %    Toggle_Terminal = Toggle_Terminal5��    0                    �                    5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                 v        f��     �   0   2   3      %    toggle_Terminal = Toggle_Terminal5��    0                    �                    5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                 v        f��     �   0   2   3      %    Toggle_Terminal = Toggle_Terminal5��    0                    �                    5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                 v        f��     �   0   2   3      %    Toggle_Terminal = toggle_Terminal5��    0                    �                    5�_�                    0       ����                                                                                                                                                                                                                                                                                                                                                 v        f��     �   /   1   3      &    Init_Popup_Term = Init_Popup_Term,5��    /                    �                    5�_�                    0       ����                                                                                                                                                                                                                                                                                                                                                 v        f��     �   /   1   3      &    Init_Popup_Term = init_Popup_Term,5��    /                    �                    5�_�                    0   !    ����                                                                                                                                                                                                                                                                                                                                                 v        f��     �   /   1   3      &    Init_Popup_Term = init_popup_Term,5��    /   !                 �                    5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                 v        f��"     �   $   &   3      <        Init_Popup_Term()  -- Initialize if not already done5��    $                    �                    5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                 v        f��$     �   $   &   3      <        init_Popup_Term()  -- Initialize if not already done5��    $                    �                    5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                 v        f��'     �   $   &   3      <        init_popup_Term()  -- Initialize if not already done5��    $                    �                    5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                 v        f��)    �   2               �         3      <local termPopup  -- Keeps popup instance local to the module   Elocal isPopupVisible = false  -- Tracks visibility state of the popup�         3          local popup_width = 90       local popup_height = 20   $    local total_cols = vim.o.columns   #    local total_lines = vim.o.lines�         3          termPopup = Popup({           enter = true,           focusable = true,           border = {               style = "rounded",   &            highlight = "FloatBorder",   
        },           position = {   1            row = total_lines - popup_height - 5,   /            col = total_cols - popup_width + 5,   
        },           size = {                width = popup_width,   "            height = popup_height,   
        },       })�      !   3          termPopup:mount()   $    vim.api.nvim_command('terminal')       vim.cmd('startinsert')       termPopup:hide()�   #   -   3   	       if not termPopup then   <        init_popup_term()  -- Initialize if not already done       elseif isPopupVisible then           termPopup:hide()           isPopupVisible = false       else           termPopup:show()           isPopupVisible = true       end�   /   2   3      &    Init_Popup_Term = init_popup_term,   %    Toggle_Terminal = toggle_terminal5��    2                       �                      �    /                   x      %       #       �    #                   t      �       �       �                       �      T       P       �                       M      �      h      �                       �       Z       V       �                      5       I       T       �    2                      �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                            2           /           v        f���     �         2         termPopup = Popup({5��                         T                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       f���     �         2         local termPopup = Popup({5��                         T                     5�_�                            ����                                                                                                                                                                                                                                                                                                                            2                      v        f���    �   $   &   2      ;      init_popup_term()   -- Initialize if not already done5��    $                     �                     5�_�                    (       ����                                                                                                                                                                                                                                                                                                                                                 v        f��     �   '   )   3              isPopupVisible = true5��    '                     �                    5��