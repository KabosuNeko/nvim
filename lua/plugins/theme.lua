local transparent_groups = {
  "Normal", "NormalNC", "NormalFloat", "FloatBorder",
  "TelescopeNormal", "TelescopeBorder",
  "VertSplit", "WinSeparator", "StatusLine", "StatusLineNC",
  "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
  "LineNr", "SignColumn",
}

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
  end,
})

local wal_colors = vim.env.HOME .. "/.cache/wal/colors-wal.vim"

return {
  {
    "uZer/pywal16.nvim",
    name = "pywal16",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      if vim.fn.filereadable(wal_colors) == 1 then
        vim.cmd.colorscheme "pywal16"
      else
        require("lazy").load { plugins = { "gruvbox.nvim" } }
        vim.cmd.colorscheme "gruvbox"
      end
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
    end,
  },
}
