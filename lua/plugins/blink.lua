return {
  "saghen/blink.cmp",
  version = "*",

  config = function()
    require("blink.cmp").setup({
      fuzzy = { implementation = "prefer_rust_with_warning" },
      sources = {
        -- default = { "lsp", "easy-dotnet", "path" },
        -- providers = {
        --   ["easy-dotnet"] = {
        --     name = "easy-dotnet",
        --     enabled = true,
        --     module = "easy-dotnet.completion.blink",
        --     score_offset = 10000,
        --     async = true,
        --   },
        -- },
      },

      completion = {
        menu = { auto_show = true },
      },
      cmdline = {
        completion = {
          menu = { auto_show = true },
        },
      },

      keymap = {
        preset = "default",
        -- Make Enter (<CR>) accept the currently selected suggestion
        ["<CR>"] = { "accept", "fallback" },
        -- Make Tab navigate down the list (and jump through snippet placeholders)
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        -- Make Shift+Tab navigate up the list
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
    })
  end,
}
