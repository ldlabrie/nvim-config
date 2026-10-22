return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Choose from 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'
      -- 'deep' or 'darker' usually have the highest saturation/contrast
      style = "darker",
      transparent = true,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,
      -- code style customization
      code_style = {
        comments = "italic",
        keywords = "bold",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },
}
