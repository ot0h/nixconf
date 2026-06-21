vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		header = "",
		border = "rounded",
		focusable = true,
	},
})

do
	require("blink.cmp").setup({
		snippets = { preset = "default" },

		keymap = {
			preset = "default",

			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			["<C-y>"] = { "select_and_accept", "fallback" },
			["<Tab>"] = { "select_and_accept", "fallback" },

			["<C-d>"] = { "scroll_documentation_down" },
			["<C-u>"] = { "scroll_documentation_up" },

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
				window = { border = "single", scrollbar = false },
			},
			menu = {
				border = "single",
				scrollbar = false,
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

-- LANGUAGES

do
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- Atajos de teclado
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, opts)

		-- Formateo con Conform (Tu <leader>F)
		vim.keymap.set("n", "<leader>F", function()
			require("conform").format({ bufnr = bufnr, lsp_fallback = true })
		end, opts)
	end

	-- TYPESCRIPT / JAVASCRIPT
	vim.lsp.config("vtsls", {
		cmd = { "vtsls", "--stdio" },

		extension = {
			mjs = "javascript",
			mts = "typescript",
		},

		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"mjs",
			"mts",
		},

		root_dir = function(bufnr, on_dir)
			local fname = vim.api.nvim_buf_get_name(bufnr)

			local root = vim.fs.root(fname, {
				"tsconfig.json",
				"package.json",
				".git",
			})

			if root then
				on_dir(root)
			end
		end,

		single_file_support = false,

		capabilities = capabilities,
		on_attach = on_attach,

		settings = {
			typescript = {
				updateImportsOnFileMove = true,
				suggest = { completeFunctionCalls = true },

				inlayHints = {
					parameterNames = {
						enabled = "all",
						suppressWhenArgumentMatchesName = false,
					},

					parameterTypes = { enabled = true },

					variableTypes = {
						enabled = false,
						suppressWhenTypeMatchesName = true,
					},

					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enabled = true },
					functionTypeParameters = { enabled = true },
					enumMemberValues = { enabled = true },
				},
			},

			javascript = {
				updateImportsOnFileMove = { enabled = "always" },

				inlayHints = {
					parameterNames = { enabled = "literals" },
					parameterTypes = { enabled = false },
					variableTypes = { enabled = false },
					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enabled = false },
					enumMemberValues = { enabled = true },
				},
			},

			vtsls = {
				autoUseWorkspaceTsdk = true,
				enableMoveToFileCodeAction = true,

				experimental = {
					completion = {
						enableServerSideFuzzyMatch = true,
					},
				},
			},
		},
	})
	vim.lsp.enable("vtsls")

	-- ANGULAR
	vim.lsp.config("angularls", {
		cmd = {
			"ngserver",
			"--stdio",
			"--tsProbeLocations",
			"node_modules",
			"--ngProbeLocations",
			"node_modules/@angular/language-server",
		},

		filetypes = { "typescript", "html", "htmlangular" },

		root_dir = function(bufnr, on_dir)
			local fname = vim.api.nvim_buf_get_name(bufnr)

			local root = vim.fs.root(fname, {
				"angular.json",
			})

			if root then
				on_dir(root)
			end
		end,

		single_file_support = false,

		capabilities = capabilities,
		on_attach = on_attach,
	})
	vim.lsp.enable("angularls")

	-- LSP para Nix
	vim.lsp.config("nixd", {
		cmd = { "nixd" },
		filetypes = { "nix" },
		root_markers = { "flake.nix", "configuration.nix" },
		settings = {
			nixd = {
				nixpkgs = {
					expr = "import <nixpkgs> { }",
				},
				formatting = {
					command = { "alejandra" },
				},
				options = {
					-- Aquí le decimos que busque en tu configuración de NixOS
					nixos = {
						expr = '(builtins.getFlake "/home/rimv/nixconf").nixosConfigurations."laptop-dell".options',
					},
					-- Y aquí le decimos dónde están específicamente las de Home Manager
					["home-manager"] = {
						expr = '(builtins.getFlake "/home/rimv/nixconf").nixosConfigurations."laptop-dell".options.home-manager.users.type.getSubOptions []',
					},
				},
			},
		},
	})
	vim.lsp.enable("nixd")

	-- LSP para Lua
	vim.lsp.config("lua_ls", {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
		capabilities = capabilities,
		on_attach = on_attach,
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
					return
				end
			end
			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = {
						"lua/?.lua",
						"lua/?/init.lua",
					},
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						"${3rd}/luv/library",
						"${3rd}/busted/library",
						"${3rd}/luassert/library",
					},
				},
				telemetry = { enable = false },
			})
		end,
		settings = {
			Lua = {
				hint = {
					enable = true, -- activa los inlay hints
					arrayIndex = "Auto", -- hints en índices de array ("Auto", "Enable", "Disable")
					await = true, -- hint en llamadas que requieren await
					paramName = "All", -- nombres de parámetros ("All", "Literal", "Disable")
					paramType = true, -- tipo de parámetros
					semicolon = "SameLine", -- punto y coma implícito
					setType = true, -- tipo en asignaciones
				},
			},
		},
	})
	vim.lsp.enable("lua_ls")

	-- LSP para C/C++
	vim.lsp.config("clangd", {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=iwyu",
			"--function-arg-placeholders",
			"--fallback-style=llvm",
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		root_markers = {
			".clangd",
			"compile_commands.json",
			"compile_flags.txt",
			"CMakeLists.txt", -- agregar esto
			".git",
		},
		capabilities = capabilities,
		init_options = {
			usePlaceholders = true,
			completeUnimported = true,
			clangdFileStatus = true,
		},
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
				diagnostics = {
					enable = true,
					experimental = {
						enable = true,
					},
				},
				check = {
					command = "clippy",
				},
				inlayHints = {
					bindingModeHints = { enable = true },
					chainingHints = { enable = true },
					closingBraceHints = { enable = true, minLines = 25 },
					parameterHints = { enable = true },
					typeHints = { enable = true },
				},
			},
		},
	})
	vim.lsp.enable("rust-analyzer")

	-- LSP para TOML
	vim.lsp.config("taplo", {
		cmd = { "taplo", "lsp", "stdio" },
		filetypes = { "toml" },
		on_attach = on_attach,
		settings = {
			taplo = {
				schema = {
					associations = {
						[".*sesh\\.toml$"] = "https://github.com/joshmedeski/sesh/raw/main/sesh.schema.json",
					},
				},
			},
		},
	})
	vim.lsp.enable("taplo")

	-- LSP para Typst
	vim.lsp.config("tinymist", {
		cmd = { "tinymist" },
		filetypes = { "typst", "typ" },
		on_attach = on_attach,
		root_markers = { ".git", "typst.toml" },
		settings = {
			exportPdf = "never",
			formatterMode = "typstyle",
			semanticTokens = "enable",
			outputPath = "$root/pdf/$name",
		},
	})
	vim.lsp.enable("tinymist")

	-- LSP para HTML con SuperHTML (validación, formato, hover)
	vim.lsp.config("superhtml", {
		cmd = { "superhtml", "lsp" },
		filetypes = { "html", "shtml", "htm" },
		capabilities = capabilities,
		on_attach = on_attach,
	})
	vim.lsp.enable("superhtml")

	-- LSP para CSS/SCSS (solo CSS y LESS, SCSS lo toma somesass_ls)
	vim.lsp.config("cssls", {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "less" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			css = {
				validate = true,
				lint = {
					unknownAtRules = "ignore", -- útil si usás Tailwind/PostCSS
					duplicateProperties = "warning",
					emptyRules = "warning",
					zeroUnits = "warning",
					vendorPrefix = "warning",
				},
			},
			scss = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
			less = { validate = true },
		},
	})
	vim.lsp.enable("cssls")

	-- LSP para Tailwind CSS (clases, @apply, hover)
	vim.lsp.config("tailwindcss", {
		cmd = { "tailwindcss-language-server", "--stdio" },
		filetypes = { "css", "scss", "sass", "html", "javascript", "typescript", "typescriptreact", "javascriptreact" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {},
	})
	vim.lsp.enable("tailwindcss")

	-- LSP para Sass/SCSS (some-sass-language-server)
	vim.lsp.config("somesass_ls", {
		cmd = { "some-sass-language-server", "--stdio" },
		filetypes = { "scss", "sass" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			somesass = {
				suggestAllFromOpenDocument = true,
			},
		},
	})
	vim.lsp.enable("somesass_ls")

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

	-- Emmet Moderno (emmet-language-server)
	vim.lsp.config("emmet_language_server", {
		cmd = { "emmet-language-server", "--stdio" },
		filetypes = {
			"html",
			"css",
			"scss",
			"javascriptreact",
			"typescriptreact",
			-- "typescript",
			-- "javascript",
			"sass",
			"less",
			"heex",
			"elixir",
			"eruby",
		},
		init_options = {
			showAbbreviationSuggestions = false,
			showExpandedAbbreviation = "always",
			showSuggestionsAsSnippets = true,
		},
		capabilities = capabilities,
		on_attach = on_attach,
	})
	vim.lsp.enable("emmet_language_server")

	-- LSP para Python
	vim.lsp.config("basedpyright", {
		cmd = { "basedpyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git", ".venv" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			basedpyright = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "basic",
				},
			},
		},
	})
	vim.lsp.enable("basedpyright")

	-- LSP para Go (Golang)
	vim.lsp.config("gopls", {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_markers = { "go.work", "go.mod", ".git" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
				completeUnimported = true,
				usePlaceholders = true,
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	})
	vim.lsp.enable("gopls")

	-- LSP para Bash
	vim.lsp.config("bashls", {
		cmd = { "bash-language-server", "start" },
		filetypes = { "sh", "bash" },
		root_markers = { ".git" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			bashls = {},
		},
	})
	vim.lsp.enable("bashls")

	-- LSP para Fish
	vim.lsp.config("fish_lsp", {
		cmd = { "fish-lsp", "start" },
		filetypes = { "fish" },
		root_markers = { ".git" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			fish_lsp = {},
		},
	})
	vim.lsp.enable("fish_lsp")

	-- LSP para CSharp para Roslyn
	vim.lsp.config("roslyn", {
		cmd = { "Microsoft.CodeAnalysis.LanguageServer", "--stdio" },
		settings = {
			["csharp|inlay_hints"] = {
				csharp_enable_inlay_hints_for_implicit_object_creation = true,
				csharp_enable_inlay_hints_for_implicit_variable_types = true,
				csharp_enable_inlay_hints_for_lambda_parameter_types = true,
				csharp_enable_inlay_hints_for_types = true,
				dotnet_enable_inlay_hints_for_parameters = true,
				dotnet_enable_inlay_hints_for_literal_parameters = true,
				dotnet_enable_inlay_hints_for_indexer_parameters = true,
				dotnet_enable_inlay_hints_for_object_creation_parameters = true,
				dotnet_enable_inlay_hints_for_other_parameters = true,
				dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
				dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
				dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
			},
			["csharp|code_lens"] = {
				dotnet_enable_references_code_lens = true,
			},
			["csharp|formatting"] = {
				dotnet_organize_imports_on_format = true,
			},
			["csharp|completion"] = {
				dotnet_provide_regex_completions = true,
				dotnet_show_completion_items_from_unimported_namespaces = true,
				dotnet_show_name_completion_suggestions = true,
			},
		},
	})
	vim.lsp.enable("roslyn")
end

do
	require("conform").setup({
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			lua = { "stylua" },
			nix = { "alejandra" },
			html = { "html" },
			css = { "prettier" },
			scss = { "prettier" },
			json = { "prettier" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			typst = { "typstyle" },
			rust = { "rustfmt" },
			python = { "ruff_format", "ruff_organize_imports" },
			go = { "goimports" },
			bash = { "shfmt" },
			fish = { "fish_indent" },
			cs = { "csharpier" },
		},
		format_on_save = true,
	})
end
