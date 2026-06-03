require("roslyn").setup({
	extensions = {
		razor = {
			enabled = false,
		},
	},
	config = {
		settings = {
			["csharp|inlay_hints"] = {
				csharp_enable_inlay_hints_for_implicit_object_creation = true,
			},
			["csharp|completion"] = {
				dotnet_provide_regex_completions = true,
				dotnet_show_completion_items_from_unimported_namespaces = true,
				dotnet_show_name_completion_suggestions = true,
			},
		},
	},
})
