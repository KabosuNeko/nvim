return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "[F]ind [F]iles" },
    { "<leader>fw", function() require("telescope.builtin").live_grep() end, desc = "[F]ind by [G]rep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "[F]ind [B]uffers" },
    { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "[F]ind [R]ecent Files" },
  },
  config = function()
    local telescope = require "telescope"
    local previewers = require "telescope.previewers"

    telescope.setup {
      defaults = {
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" },
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column", "--smart-case", "--hidden", "--glob=!.git/*",
        },
        buffer_previewer_maker = function(filepath, bufnr, opts)
          opts = opts or {}
          filepath = vim.fn.expand(filepath)
          vim.uv.fs_stat(filepath, function(_, stat)
            if not stat or stat.size > 100000 then return end
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end)
        end,
        file_ignore_patterns = {
          "node_modules/", ".git/", "__pycache__/", ".cache/",
          "%.git/", "%.cache/", "%.local/",
          "%.png$", "%.jpg$", "%.jpeg$", "%.gif$", "%.svg$", "%.ico$",
          "%.mp3$", "%.flac$", "%.opus$", "%.m4a$",
          "%.zip$", "%.tar$", "%.tar%.gz$", "%.tgz$", "%.rar$", "%.7z$",
          "%.pdf$", "%.docx$", "%.xlsx$",
          "%.mkv$", "%.mp4$",
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
          vertical = { mirror = false },
          width = 0.87, height = 0.80, preview_cutoff = 120,
        },
        sorting_strategy = "ascending",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      pickers = {
        find_files = { hidden = true },
        live_grep = { hidden = true },
      },
    }
  end,
}
