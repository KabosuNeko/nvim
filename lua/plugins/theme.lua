return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      local transparent_groups = {
        "Normal", "NormalNC", "NormalFloat", "FloatBorder",
        "TelescopeNormal", "TelescopeBorder",
        "VertSplit", "WinSeparator", "StatusLine", "StatusLineNC",
        "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
        "LineNr", "SignColumn",
      }
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox",
        callback = function()
          for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
          end
        end,
      })
      vim.cmd.colorscheme "gruvbox"
    end,
  },
}
