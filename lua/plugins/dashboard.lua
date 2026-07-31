return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",

    config = function()
      local alpha = require "alpha"
      local dashboard = require "alpha.themes.dashboard"

      vim.api.nvim_exec_autocmds("ColorScheme", { pattern = "*" })
      -- Define Main Dashboard
      function OpenMainDashboard()
        dashboard.section.header.val = {
          "⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠄⠀⠀⠀⠀⠀⠂⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠠⠐",
          "⠀⠠⠀⠀⠀⠀⠀⠠⠀⠀⠀⠨⣴⡶⡴⡜⣾⣰⢀⡀⠀⠀⠀⠀⠀⠈⠀⠀⠀",
          "⠀⠀⠀⠀⠈⠀⠀⠄⠀⠀⠀⣘⡿⣽⣗⣯⣿⣼⠽⣵⡆⠀⠈⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠂⠀⠀⠄⠀⠀⠀⠀⠠⣽⣓⡿⣿⣿⣿⣷⡯⣷⢲⠧⠀⠀⠀⠄⠂⠀⠈",
          "⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⣠⣤⣿⠓⣿⣿⣿⣿⣗⣯⣿⣶⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠤⣍⡿⣶⡿⣵⣖⡶⣽⠿⠗⠀⠀⠀⠈⠀⠀⠀",
          "⠀⡀⠀⠀⠀⢀⠀⠀⣠⣶⣤⠄⢸⣟⣿⠁⣀⠈⠋⠙⠀⠀⠀⠀⠀⠀⠀⠀⠐",
          "⠀⠀⠀⠀⠀⠀⠀⣾⡿⣿⣀⢇⠸⠁⢿⠿⡿⢿⣿⡆⠀⠀⠀⠀⠀⠈⠀⠀⠀",
          "⠀⡀⠠⠀⠀⠀⠀⣻⣷⣿⣿⡆⠕⣄⢘⣟⠉⠀⠑⢿⠀⠀⠀⠀⠄⠀⠀⠀⡀",
          "⠀⠄⠀⠀⠠⠀⠀⣹⠿⠟⠋⠀⠀⠀⠱⣹⡄⡘⢦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠰⠃⠀⠀⠀⠀⣾⣿⣷⣹⠋⠀⠀⠙⢿⡇⠀⠀⠀⠠⠀⠀⠂",
          "⠄⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⡿⠂⠀⠀⠀⠈⠁⠀⠄⠀⠀⠀⠀⠀",
          "⠀⡀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠉⠀⠀⢀⡇⠀⠀⠈⠀⠀⠀⢀⠀⠀⠀⢀⠀⠂",
          "⠀⠀⠀⠀⠀⠠⠀⠀⠂⠀⠀⠀⠀⠀⢸⠁⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⡀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠂⠀⠈⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠁⠀⡀",
          "⠀⠀⠀⠀⠀⡀⠀⠀⠁⠀⠀⠀⠀⠂⠀⠀⠄⠀⠀⠀⠠⠀⠀⠀⠀⠂⠀⠀⠀",
          "⡀⠂⠈⠀⠂⠀⠀⠀⡀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠠⠀⠀⠀⠀⠠",
        }

        dashboard.section.buttons.val = {
          dashboard.button("g", "  Git Repositories", ":OpenGitRepos <CR>"),
          dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
          dashboard.button("ff", "󰈞  Find Files", ":Telescope find_files<CR>"),
          dashboard.button("fw", "󰱼  Grep Text", ":Telescope live_grep<CR>"),
          dashboard.button("fr", "  Recent Files", ":Telescope oldfiles<CR>"),
          dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        alpha.setup(dashboard.config)
        vim.schedule(function()
          vim.cmd "stopinsert | redraw!"
        end)
      end

      -- Initialize Main Dashboard
      OpenMainDashboard()
      vim.keymap.set("n", "<leader>dd", "<cmd>Alpha<CR>", { desc = "Reopen [D]ash[D]oard" })
    end,
  },
}
