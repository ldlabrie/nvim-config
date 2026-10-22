-- For `plugins/markview.lua` users.
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  opts = {
    preview = {
      enable_hybrid_mode = true,
      hybrid_modes = { "n", "i" }, -- normal + insert mode
      modes = { "n", "i", "no", "c" }, -- must include the same modes here too
    },
  },
  -- Completion for `blink.cmp`
  -- dependencies = { "saghen/blink.cmp" },
}
