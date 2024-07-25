return {
  {
    "sourcegraph/sg.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    -- If you have a recent version of lazy.nvim, you don't need to add this!
    keys = {
      { "<leader>sgf", ":lua require('sg.extensions.telescope').fuzzy_search_results()<CR>" },
      { "<leader>sge", "<cmd>'<,'> CodyAsk explain<CR>", mode = "v" },
      { "<leader>sgp", "<cmd>'<,'> CodyAsk Improve Performance:<CR>", mode = "v" },
    },
    build = "nvim -l build/init.lua",
    opts = function(_, opts)
      local sg = require("sg")
      table.insert(opts, { enable_cody = true, accept_tos = true, download_binaries = true })
      table.insert(opts, { chat = { default_model = "anthropic/claude-3-5-sonnet-20240620" } })
      sg.setup(opts)
    end,
  },
}
