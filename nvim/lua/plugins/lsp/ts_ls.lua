local general_root = require("plugins.lsp.util").general_root
local ts_js_root = { "jsconfig.json", "tsconfig.json", "package.json" }
local merge_tables = require("utils").merge_tables
local util = require "lspconfig/util"

return {
  cmd = {
    "typescript-language-server",
    "--stdio",
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = function(fname)
    return util.root_pattern(unpack(merge_tables(ts_js_root, general_root)))(fname)
      or util.find_git_ancestor(fname)
      or util.path.dirname(fname)
  end,
}
