return {
  "ibhagwan/fzf-lua",
  optional = true,
  opts = function(_, opts)
    local actions = require("fzf-lua.actions")
    return vim.tbl_deep_extend("force", opts, {
      files = {
        cwd_prompt = false,
        actions = {
          ["alt-h"] = { actions.toggle_ignore },
          ["alt-i"] = { actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ["alt-h"] = { actions.toggle_ignore },
          ["alt-i"] = { actions.toggle_hidden },
        },
      },
    })
  end,
}
