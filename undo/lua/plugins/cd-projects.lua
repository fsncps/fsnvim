return {
   "LintaoAmons/cd-project.nvim",
   -- Don't need call the setup function if you think you are good with the default configuration
   tag = "v0.6.1",   -- Optional, You can also use tag to pin the plugin version for stability
   init = function() -- use init if you want enable auto_register_project, otherwise config is good
      require("cd-project").setup({
         -- this json file is acting like a database to update and read the projects in real time.
         -- So because it's just a json file, you can edit directly to add more paths you want manually
         projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
         -- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
         project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
         choice_format = "both",        -- optional, you can switch to "name" or "path"
         projects_picker = "vim-ui",    -- optional, you can switch to `telescope`
         auto_register_project = false, -- optional, toggle on/off the auto add project behaviour
         -- do whatever you like by hooks
         hooks = {
            {
               callback = function(dir)
                  vim.notify("switched to dir: " .. dir)
               end,
            },
            {
               callback = function(_)
                  vim.cmd("Telescope find_files")
               end,
            },
            {
               callback = function(dir)
                  vim.notify("switched to dir: " .. dir)
               end,                         -- required, action when trigger the hook
               name = "cd hint",            -- optional
               order = 1,                   -- optional, the exection order if there're multiple hooks to be trigger at one point
               pattern = "cd-project.nvim", -- optional, trigger hook if contains pattern
               trigger_point = "DISABLE",   -- optional, enum of trigger_points, default to `AFTER_CD`
               match_rule = function(dir)   -- optional, a function return bool. if have this fields, then pattern will be ignored
                  return true
               end,
            },
         }
      })
   end,
}
