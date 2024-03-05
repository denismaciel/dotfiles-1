local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
}

function M.init()
  vim.keymap.set("n", "<Leader>n", ":Neotree toggle reveal<CR>")
end

function M.config()
  local status_ok, neo_tree = pcall(require, "neo-tree")
  if not status_ok then
    return
  end

  neo_tree.setup {
    close_if_last_window = true,
    enable_diagnostics = false,
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules",
          "__pycache__",
          ".git",
        },
        hide_by_pattern = {
          "*.cache",
          "*.egg-info",
        },
        never_show = {
          ".DS_Store",
        },
      },
    },
  }
end

return M
