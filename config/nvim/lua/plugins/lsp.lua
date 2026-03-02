do
	vim.diagnostic.config({
		virtual_text = {
			prefix = "●",
			source = "if_many",
		},
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
	})
end

do
	require("blink.cmp").setup({
		snippets = { preset = "default" },

		keymap = {
			preset = "default",

			["<C-p"] = { "select_prev", "fallback" },
			["<C-n"] = { "select_next", "fallback" },

			["<C-y"] = { "select_and_accept", "fallback" },
			["tab"] = { "select_and_accept", "fallback" },

			["<C-space>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},
		},

		cmdline = {
			keymap = { preset = "inherit" },
			completion = { menu = { auto_show = true } },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
				window = { border = "single" },
			},
			menu = {
				border = "none",
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									-- Requiere plugin 'onsails/lspkind.nvim'
									icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local _, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_hl then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = {
			implementation = "lua",
		},
	})
end

do
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- Atajos de teclado
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, opts)

		-- Formateo con Conform (Tu <leader>F)
		vim.keymap.set("n", "<leader>F", function()
			require("conform").format({ bufnr = bufnr, lsp_fallback = true })
		end, opts)
	end

	-- LSP para Typescript y Javascript
	vim.lsp.config("vtsls", {
		cmd = { "vtsls", "--stdio" },
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		root_markers = { ".git", "package.json", "tsconfig.json" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			typescript = {
				updateImportsOnRename = true,
				suggest = { completeFunctionCalls = true },
			},
			vtsls = {
				autoUseWorkspaceTsdk = true,
			},
		},
	})
	vim.lsp.enable("vtsls")

	-- LSP para Nix
	vim.lsp.config("nixd", {
		cmd = { "nixd" },
		filetypes = { "nix" },
		root_markers = { "flake.nix", "configuration.nix" },
	})
	vim.lsp.enable("nixd")

	-- LSP para Lua
	vim.lsp.config("lua_ls", {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	})
	vim.lsp.enable("lua_ls")

	-- LSP para C/C++
	vim.lsp.config("clangd", {
		cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		root_markers = { ".clangd", ".clang-format", "compile_commands.json", "compile_flags.txt", ".git" },
		capabilities = capabilities,
	})
	vim.lsp.enable("clangd")

	-- LSP Rust
	vim.lsp.config("rust-analyzer", {
		cmd = { "rust-analyzer" },
		filetypes = { "rust" },
		root_markers = { "Cargo.toml", "rust-project.json", ".git" },
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
				},
			},
		},
	})
	vim.lsp.enable("rust-analyzer")

	-- LSP para Typst
	vim.lsp.config("tinymist", {
		cmd = { "tinymist" },
		filetypes = { "typst", "typ" },
		on_attach = on_attach,
	})
	vim.lsp.enable("tinymist")

	-- LSP para HTML
	vim.lsp.config("html", {
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html", "templ" },
		capabilities = capabilities,
		on_attach = on_attach,
	})
	vim.lsp.enable("html")

	-- LSP para CSS/SCSS
	vim.lsp.config("cssls", {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		capabilities = capabilities,
		on_attach = on_attach,
	})
	vim.lsp.enable("cssls")

	-- LSP para JSON
	vim.lsp.config("jsonls", {
		cmd = { "vscode-json-language-server", "--stdio" },
		filetypes = { "json" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})
	vim.lsp.enable("jsonls")

	-- Emmet
	vim.lsp.config("emmet_ls", {
		cmd = { "emmet-ls", "--stdio" },
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
		capabilities = capabilities,
		on_attach = on_attach,
	})
	vim.lsp.enable("emmet_ls")
end

do
	require("conform").setup({
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			lua = { "stylua" },
			nix = { "alejandra" },
			html = { "prettier" },
			ccs = { "prettier" },
			sccs = { "prettier" },
			json = { "prettier" },
			typst = { "typstyle" },
			rust = { "rustfmt" },
		},
		format_on_save = true,
	})
end
