# Design: Keymap, which-key & Telescope Cleanup

**Date:** 2026-07-02
**Status:** Approved
**Scope:** Clean up lua modules for keybinds, which-key, and telescope. Keep all functionality and keys. Goal: optimal which-key context help.

## Principles

1. `vim.keymap.set()` is the single source of truth for real mappings
2. `which-key` `opts.spec` contains group labels only (metadata, no actions)
3. Every mapping gets a `desc`
4. No key changes, no functionality loss
5. Plugin-specific mappings stay in plugin configs
6. General mappings live in `keymap.lua`

## Load Order Context

```
init.lua:
  1. lazy.setup("plugins")     registers specs
  2. opts
  3. fnct
  4. cmd
  5. cmd.auto
  6. conf                      Require_All scans conf/ alphabetically:
     conf/cokeline.lua           (c < w, loads first)
     conf/which-key.lua          (loads second, triggers plugin load via require)
  7. keymap                    runs AFTER conf
  8. misc.eris
```

Key insight: `plugins/which-key.lua` runs early (plugin load), `conf/which-key.lua` runs at step 6, `keymap.lua` runs at step 7 (last). Group labels are safe in the plugin spec (pure metadata). Actual keymap actions belong in `keymap.lua` (dependencies guaranteed loaded).

## Files Changed

| File | Action |
|------|--------|
| `init.lua` | Modify — fix maplocalleader typo |
| `lua/plugins/which-key.lua` | Rewrite — full setup + groups + helper keys |
| `lua/keymap.lua` | Modify — absorb 9 mappings, remove 3 duplicates, add descs |
| `lua/plugins/telescope.lua` | Modify — fix 3 extensions, fix project config, remove dups |
| `lua/conf/cokeline.lua` | Modify — remove 4 dead-code duplicate keymaps |
| `lua/conf/which-key.lua` | Delete — groups to plugins/, mappings to keymap.lua |
| `lua/conf/ts-file-browser.lua` | Delete — absorbed into telescope.lua |

## Detailed Changes

### 1. init.lua

- Line 15: `vim.g.maplocalleaderg` -> `vim.g.maplocalleader`

### 2. lua/plugins/which-key.lua (full rewrite)

```lua
return {
   "folke/which-key.nvim",
   event = "VeryLazy",
   init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
   end,
   opts = {
      preset = "modern",
      delay = function(ctx)
         return ctx.plugin and 0 or 200
      end,
      plugins = {
         marks = true,
         registers = true,
         spelling = {
            enabled = true,
            suggestions = 20,
         },
         presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
         },
      },
      spec = {
         { "<leader>b", group = "Buffers" },
         { "<leader>t", group = "Tabs" },
         { "<leader>w", group = "Window" },
         { "<leader>f", group = "File" },
         { "<leader>s", group = "Search" },
         { "<leader>c", group = "Clipboard" },
         { "<leader>p", group = "Projects" },
         { "<leader>x", group = "Trouble" },
      },
   },
   keys = {
      {
         "<leader>?",
         function()
            require("which-key").show({ global = false })
         end,
         desc = "Buffer Local Keymaps",
      },
      {
         "<leader>K",
         function()
            require("which-key").show()
         end,
         desc = "Show All Keymaps",
      },
      {
         "<leader>Z",
         function()
            require("which-key").show({ keys = "z" })
         end,
         desc = "Show z Commands",
      },
      {
         "<leader>W",
         function()
            require("which-key").show({ keys = "<C-w>", loop = true })
         end,
         desc = "Show Window Commands",
      },
   },
}
```

### 3. lua/keymap.lua

**Remove duplicates:**
- Line 115: `<leader>bp` -> `:bprevious` (conflicts with pick-focus at line 30)
- Line 107: `<leader>pa` (duplicate of line 88)

**Fix descs on existing:**
- Line 23 `<leader>E`: add desc "Toggle File Explorer"
- Line 26 `<space>B`: add desc "Telescope File Browser"
- Line 112 `<leader>tp`: fix desc "Next Tab" -> "Previous Tab"
- Lines 94-104: terminal mode keymaps (replace `desc = ""` with proper descriptions)
- Line 114 `<leader>bn`: add desc "Next Buffer"

**Absorb unique mappings from conf/which-key.lua:**
- `<leader>wc` -> `:close<CR>` — "Close window"
- `<leader>ws` -> `:split<CR>` — "Horizontal split"
- `<leader>wv` -> `:vsplit<CR>` — "Vertical split"
- `<leader>fs` -> `:w<CR>` — "Save file"
- `<leader>fq` -> `:q<CR>` — "Quit file"
- `<leader>e` -> `:Neotree<CR>` — "Toggle File Explorer"
- `<leader>cy` -> `"+y` (n, v modes) — "Yank to System Clipboard"
- `<leader>cp` -> `"+p` — "Paste from System Clipboard"

**New alias (preserves lost functionality):**
- `<leader>bP` -> `:bprevious<CR>` — "Previous Buffer"

### 4. lua/plugins/telescope.lua

**Fix extension loading order:**
- Move `load_extension("project")` to AFTER `setup()`
- Add `load_extension("fzf")`
- Add `load_extension("ui-select")`
- Add `load_extension("file_browser")`

**Fix setup config:**
- Move `project` table out of `["ui-select"]` nesting (sibling key)
- Add `fzf` extension config: `{ fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" }`
- Add `file_browser` extension config
- Remove `harpoon` reference in `on_project_selected` -> use default `change_working_directory`

**Remove duplicates:**
- Lines 53-56: remove 4 duplicate `<leader>sh` (keep one)
- Line 51: remove `<leader>ph` (duplicate of `<leader>sh`)

**Add:**
- `<C-p>`: add desc "Project Picker"
- `<leader>sb` -> `builtin.buffers` — "Search Buffers"

### 5. lua/conf/cokeline.lua

**Remove dead-code keymaps** (overridden by keymap.lua at runtime):
- Lines 128-142: `<leader>tn`/`tp` circular versions
- Line 146: `<leader>bn` -> `:bnext`
- Line 147: `<leader>bp` -> `:bprevious`

**Keep unchanged:**
- cokeline `setup()` with components and sidebar
- `RenameTab` command
- `<leader>bt` toggle function (lines 103-107)
- `BufEnter` autocmd for tab buffer tracking

### 6. lua/conf/which-key.lua — DELETE

All content absorbed:
- Group labels -> `plugins/which-key.lua` `opts.spec`
- Unique keymap actions -> `keymap.lua`
- Duplicate keymap actions -> removed (already in keymap.lua or telescope.lua)

### 7. lua/conf/ts-file-browser.lua — DELETE

Extension config and loading absorbed into `plugins/telescope.lua`.

## Out of Scope (not modified)

- `plugins/opencode.lua` — keymaps have descs, no conflicts
- `plugins/trouble.lua` — clean lazy keys with descs
- `plugins/lazygit.lua` — clean
- `plugins/conform.lua` — `<leader>f` stays (coexists with File group)
- `cmd/Bdelete.lua` — `<A-q>` has desc
- `plugins/neoclip.lua` — extension loading stays
- `conf/zz-tree.lua` — NvimTree config
- `conf/mini.lua` — mini.move config
- All other files

## Conflict Resolution Decisions

| Conflict | Resolution | Rationale |
|----------|-----------|-----------|
| `<leader>bp` (3 definitions) | Keep pick-focus (keymap.lua:30), remove `:bprevious` (line 115, cokeline:147), add `<leader>bP` = prev | User chose pick-focus; bP preserves navigation |
| `<leader>sh` (5 definitions) | Keep one in telescope.lua | Pure redundancy |
| `<leader>tn`/`tp` (2 definitions each) | Keep keymap.lua (current runtime), remove cokeline.lua (dead code) | keymap.lua loads last, wins at runtime |
| `<leader>bn` (2 definitions) | Keep keymap.lua, remove cokeline.lua | Identical, deduplicate |
| `<leader>pa` (2 definitions in keymap.lua) | Keep line 88, remove line 107 | Identical, deduplicate |
| `<leader>f` group vs format | Both coexist | Ambiguous key shows group popup during timeout; immediate press executes format |
| `<leader>c` group (Clipboard vs Claude/Trouble) | Keep "Clipboard" label | User said keep keys; group label is cosmetic |
