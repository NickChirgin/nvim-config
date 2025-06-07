---@type vim.lsp.Config
return {
    cmd = { "gopls" },
    root_markers = { "go.work", "go.mod", ".git" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
		gopls = {
			analyses = {
			unusedparams = true,
			},
			gofumpt = true, -- Auto-formatting
			staticcheck = true,
		},
	},

}
