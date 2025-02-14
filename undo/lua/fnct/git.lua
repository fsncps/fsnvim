local Job = require('plenary.job')

local function get_git_info(filepath, format)
   local result = Job:new({
      command = 'git',
      args = { 'log', '-1', '--pretty=format:' .. format, '--', filepath },
      cwd = vim.fn.fnamemodify(filepath, ":h"),
   }):sync()

   if result[1] then
      return result[1]
   else
      return "No data"
   end
end

local function format_date(date_str)
   local pattern = "(%d+)%-(%d+)%-(%d+)"
   local year, month, day = date_str:match(pattern)
   if year and month and day then
      return string.format("%02d-%02d-%02d", day, month, year:sub(3, 4))
   else
      return date_str
   end
end

local function get_git_date(filepath)
   local date_str = get_git_info(filepath, '%ad')
   return format_date(date_str)
end

local function get_descriptive_status(short_status)
   local status_map = {
      ['M'] = "GIT: Modified ",
      ['A'] = "GIT: Added ",
      ['D'] = "GIT: Deleted ",
      ['R'] = "GIT: Renamed ",
      ['C'] = "GIT: Copied ",
      ['U'] = "GIT: Unmerged ",
      ['??'] = "GIT: Untracked "
   }
   return status_map[short_status] or "unknown"
end

local function get_git_status(filepath)
   local result = Job:new({
      command = 'git',
      args = { 'status', '--porcelain', '--', filepath },
      cwd = vim.fn.fnamemodify(filepath, ":h"),
   }):sync()

   if result[1] then
      local short_status = result[1]:sub(1, 2):gsub("%s+", "") -- Extract the short status code
      return get_descriptive_status(short_status)
   else
      return "Untracked"
   end
end

return {
   GET_COMMIT_HASH = function(filepath)
      return get_git_info(filepath, '%h')
   end,
   GET_AUTHOR = function(filepath)
      return get_git_info(filepath, '%an')
   end,
   GET_DATE = get_git_date,
   GET_COMMIT_MSG = function(filepath)
      return get_git_info(filepath, '%s')
   end,
   GET_STATUS = get_git_status,
}

