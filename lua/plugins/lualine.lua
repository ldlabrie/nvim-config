return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- 1. Create the component function
    local function dotnet_status()
      return vim.g.dotnet_build_status or ""
    end

    -- 2. Define the component with conditions and dynamic coloring
    local dotnet_component = {
      dotnet_status,
      cond = function()
        return vim.g.dotnet_build_status ~= nil and vim.g.dotnet_build_status ~= ""
      end,
      color = function()
        local status = vim.g.dotnet_build_status or ""
        if status:find("Failed") then
          return { fg = "#ff0000", gui = "bold" }
        elseif status:find("Success") then
          return { fg = "#a6e22e", gui = "bold" }
        end
        return { fg = "#fd971f", gui = "bold" }
      end,
    }

    -- 3. Safely prepend it to lualine_x (usually cleaner than z)
    -- We use lualine_x because z often has a colored background that overrides text colors
    if not opts.sections.lualine_x then
      opts.sections.lualine_x = {}
    end
    table.insert(opts.sections.lualine_x, 1, dotnet_component)
  end,
}
