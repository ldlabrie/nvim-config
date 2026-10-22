-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cb", function()
  -- 1. Set status to building
  vim.g.dotnet_build_status = "󱓞 Building..."
  vim.cmd("redrawstatus") -- Force the status bar to update immediately

  vim.cmd("compiler dotnet")

  -- 2. Run the build
  -- Using pcall ensures the code continues even if the build command fails
  pcall(function()
    vim.cmd("make!")
  end)

  -- 3. Logic to determine if it finished with errors or success
  local qflist = vim.fn.getqflist()
  local has_errors = false
  for _, item in ipairs(qflist) do
    if item.type == "E" or item.type == "e" then
      has_errors = true
      break
    end
  end

  if has_errors then
    vim.g.dotnet_build_status = " Build Failed"
  else
    vim.g.dotnet_build_status = " Build Success"
  end

  -- 4. Sort and show window (your existing logic)
  -- ... [Insert your sorting logic here] ...

  vim.cmd("cwindow")
  vim.cmd("redrawstatus")

  -- 5. Clear the message after 5 seconds so it doesn't stay there forever
  vim.defer_fn(function()
    vim.g.dotnet_build_status = nil
    vim.cmd("redrawstatus")
  end, 5000)
end, { desc = "Build .NET with Status" })

-- Add zz after <C-d> <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Add move buffer tabs
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })

-- Delete all buffers to the left
vim.keymap.set("n", "<leader>bR", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete Buffers to the Left" })

-- Control backspace and control delete for deleting whole words
-- Ctrl+Backspace: delete word before cursor
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word before cursor" })
vim.keymap.set("i", "<C-h>", "<C-w>", { desc = "Delete word before cursor" })
-- Ctrl+Delete: delete word after cursor
vim.keymap.set("i", "<C-Del>", "<C-o>de", { desc = "Delete word after cursor" })
