Vim�UnDo� #?�U)D��Os{�6�"Ԧb��on5EL8c                                     f��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             f��    �                   �               5��                                           �      5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             f��    �                  �               $  local Job = require('plenary.job')     local result = Job:new({       command = 'git',   4    args = { 'log', '-1', '--pretty=%B', filepath },   X    cwd = vim.fn.fnamemodify(filepath, ":h"), -- Run the command in the file's directory     }):sync()�                 if result[1] then       return result[1]     else       return "No commits"     end5��                           �                      �                       '      F       M       �                       7       �       �       �                          �                     5��