return {
  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup DAP UI with its default options
      dapui.setup(opts)

      -- Auto-open DAP UI when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- Auto-close DAP UI and FIX NEO-TREE SIZING when debugging stops
      -- local function close_and_balance()
      --   dapui.close()
      --
      --   vim.schedule(function()
      --     -- 1. Balance the normal code windows
      --     vim.cmd("wincmd =")
      --
      --     -- Translate <leader>e into actual keystrokes Neovim understands
      --     local leader_e = vim.api.nvim_replace_termcodes("<leader>e", true, false, true)
      --
      --     -- 1. Press <leader>e to close Neo-tree
      --     vim.api.nvim_feedkeys(leader_e, "m", false)
      --
      --     -- 2. Wait 50 milliseconds for the layout to reset, then press it again
      --     vim.defer_fn(function()
      --       vim.api.nvim_feedkeys(leader_e, "m", false)
      --     end, 50)
      --     -- vim.defer_fn(function()
      --     --   vim.api.nvim_feedkeys("<C-l>", "m", false)
      --     -- end, 50)
      --   end)
      -- end

      dap.listeners.before.event_terminated["dapui_config"] = close_and_balance
      dap.listeners.before.event_exited["dapui_config"] = close_and_balance
    end,
  },
}
