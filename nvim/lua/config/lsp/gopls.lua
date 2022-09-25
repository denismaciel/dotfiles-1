local general_root = require "config.lsp.util".general_root
local merge_tables = require("utils").merge_tables
local util = require "lspconfig/util"
local go_root = { "go.sum", "go.mod" }

return function(lspconfig)
	lspconfig.gopls.setup {
		cmd = { vim.fn.exepath "gopls", "-logfile", "/tmp/gopls.log" },
    root_dir = function(fname)
      return util.root_pattern(unpack(merge_tables(go_root, general_root)))(fname)
        or util.find_git_ancestor(fname)
        or util.path.dirname(fname)
    end,
		init_options = {
			usePlaceholders = true,
			linkTarget = "pkg.go.dev",
			completionDocumentation = true,
			completeUnimported = true,
			deepCompletion = true,
			fuzzyMatching = true,
		},
	}
end
