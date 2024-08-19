return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fl",
      LazyVim.pick("live_grep", { cwd = vim.uv.cwd() .. "/src/", no_ignore = true }),
    },
    {
      "<leader>fs",
      LazyVim.pick("find_files", { cwd = vim.uv.cwd() .. "/src/", no_ignore = true }),
    },
  },
  opts = function(_, opts)
    local actions = require("telescope.actions")
    if not opts.defaults then
      opts.defaults = {}
    end
    if not opts.defaults.mappings then
      opts.defaults.mappings = {}
    end
    if not opts.defaults.mappings.n then
      opts.defaults.mappings.n = {}
    end

    local find_files_no_ignore = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      if current_picker.prompt_title == "Live Grep" then
        LazyVim.pick("live_grep", { hidden = true, no_ignore = true, default_text = line })()
      else
        LazyVim.pick("find_files", { hidden = true, no_ignore = true, default_text = line })()
      end
    end

    local find_files_src = function(prompt_bufnr)
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      local cwd = vim.uv.cwd() .. "/src/"
      local current_picker = action_state.get_current_picker(prompt_bufnr)
      if current_picker.prompt_title == "Live Grep" then
        LazyVim.pick("live_grep", { hidden = true, no_ignore = true, cwd = cwd, default_text = line })()
      else
        LazyVim.pick("find_files", { hidden = true, no_ignore = true, cwd = cwd, default_text = line })()
      end
    end

    opts.defaults.mappings.i["<C-h>"] = find_files_no_ignore
    opts.defaults.mappings.i["<C-j>"] = find_files_src
  end,
}
