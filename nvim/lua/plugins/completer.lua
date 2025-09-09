return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "cargo build --release",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
			signature = { enabled = true },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"mfussenegger/nvim-jdtls",
		config = function()
			local config = {
			    cmd = {'/opt/homebrew/Cellar/jdtls/1.49.0/libexec/bin/jdtls'},
			    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
			}
			require('jdtls').start_or_attach(config)
		end,
	}
}
