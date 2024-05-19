return {
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
    },
    keys = {
      {
        "<leader>se",
        function()
          require("sg.extensions.telescope").fuzzy_search_results()
        end,
        desc = "Find with sourcegraph",
      },
    },
    opts = {
      enable_cody = true,
      accept_tos = true,
      download_binaries = true,
    },
    config = function(_, opts)
      local sg = require("sg")
      sg.setup(opts)
    end,
  },
}
