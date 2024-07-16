local function get_last_git_commit_message(filepath)
   local Job = require('plenary.job')
   local result = Job:new({
      command = 'git',
      args = { 'log', '-1', '--pretty=%B', filepath },
      cwd = vim.fn.fnamemodify(filepath, ":h"), -- Run the command in the file's directory
   }):sync()

   if result[1] then
      return result[1]
   else
      return "No commits"
   end
end

return { Last_Commit = get_last_git_commit_message }
