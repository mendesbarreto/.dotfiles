return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = { "saghen/blink.compat" },
  opts = {
    sources = {
      compat = { "cody" },
      providers = {
        cody = {
          kind = "Cody",
          score_offset = 100,
          async = true,
        },
      },
    },
  },
}
