return {
  "nvim-cmp",
  optional = true,
  -- @param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    table.insert(opts.sources, 1, { name = "cody", group_index = 1, priority = 100 })
  end,
}
