return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"ojroques/nvim-hardline",
		config = function(_, opts)
			require('hardline').setup {
				bufferline = false, -- disable bufferline
				bufferline_settings = {
					exclude_terminal = false, -- don't show terminal buffers in bufferline
					show_index = false, -- show buffer indexes (not the actual buffer numbers) in bufferline
				},
				theme = "gruvbox", -- change theme
				sections = { -- define sections
					{ class = "mode", item = require("hardline.parts.mode").get_item },
					{ class = "high", item = require("hardline.parts.git").get_item, hide = 100 },
					{ class = "med", item = require("hardline.parts.filename").get_item },
					{ class = "med", item = "%=" },
					{ class = "low", item = require("hardline.parts.wordcount").get_item, hide = 100 },
					{ class = "error", item = require("hardline.parts.lsp").get_error },
					{ class = "warning", item = require("hardline.parts.lsp").get_warning },
					{ class = "warning", item = require("hardline.parts.whitespace").get_item },
					{ class = "high", item = require("hardline.parts.filetype").get_item, hide = 60 },
					{ class = "mode", item = require("hardline.parts.line").get_item },
				}
			}
		end,
	},
	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme miasma")
		end,
	},
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
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
