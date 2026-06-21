# Configuración de LSPs basada en ~/.config/nvim/lua/plugins/lsp.lua
{
  pkgs,
  lib,
  ...
}: {
  # ── Rust ──────────────────────────────────────────────────────────
  rust-analyzer = {
    binary.path_lookup = true;
    settings = {
      check.command = "clippy";
      imports = {
        granularity.group = "module";
        prefix = "self";
      };
      cargo.buildScripts.enable = true;
      procMacro.enable = true;
      diagnostics.experimental.enable = true;
      inlayHints = {
        bindingModeHints.enable = true;
        chainingHints.enable = true;
        closingBraceHints = {
          enable = true;
          minLines = 25;
        };
        parameterHints.enable = true;
        typeHints.enable = true;
      };
    };
  };

  # ── TypeScript / JavaScript (vtsls) ──────────────────────────────
  typescript-language-server = {
    binary.path_lookup = true;
    settings = {
      typescript = {
        updateImportsOnFileMove = true;
        suggest.completeFunctionCalls = true;
        inlayHints = {
          parameterNames = {
            enabled = "all";
            suppressWhenArgumentMatchesName = false;
          };
          parameterTypes.enabled = true;
          variableTypes.enabled = false;
          propertyDeclarationTypes.enabled = true;
          functionLikeReturnTypes.enabled = true;
          enumMemberValues.enabled = true;
        };
      };
      javascript = {
        inlayHints = {
          parameterNames.enabled = "literals";
          parameterTypes.enabled = false;
          variableTypes.enabled = false;
          propertyDeclarationTypes.enabled = true;
          functionLikeReturnTypes.enabled = false;
          enumMemberValues.enabled = true;
        };
      };
      vtsls = {
        autoUseWorkspaceTsdk = true;
        enableMoveToFileCodeAction = true;
        experimental.completion.enableServerSideFuzzyMatch = true;
      };
    };
  };

  # ── Python (basedpyright) ────────────────────────────────────────
  basedpyright = {
    binary.path_lookup = true;
    settings = {
      basedpyright.analysis = {
        autoSearchPaths = true;
        diagnosticMode = "openFilesOnly";
        useLibraryCodeForTypes = true;
        typeCheckingMode = "basic";
      };
    };
  };

  # ── Ruff (linter/formatter) ──────────────────────────────────────
  ruff.binary.path_lookup = true;

  # ── Go (gopls) ───────────────────────────────────────────────────
  gopls = {
    binary.path_lookup = true;
    settings = {
      gopls = {
        analyses = {
          unusedparams = true;
          shadow = true;
        };
        staticcheck = true;
        completeUnimported = true;
        usePlaceholders = true;
        hints = {
          assignVariableTypes = true;
          compositeLiteralFields = true;
          compositeLiteralTypes = true;
          constantValues = true;
          functionTypeParameters = true;
          parameterNames = true;
          rangeVariableTypes = true;
        };
      };
    };
  };

  # ── C / C++ (clangd) ────────────────────────────────────────────
  clangd = {
    binary = {
      path_lookup = true;
      arguments = [
        "--background-index"
        "--clang-tidy"
        "--header-insertion=iwyu"
        "--function-arg-placeholders"
        "--fallback-style=llvm"
      ];
    };
  };

  # ── Nix (nixd) ───────────────────────────────────────────────────
  nixd = {
    binary.path_lookup = true;
    settings = {
      nixd = {
        nixpkgs.expr = "import <nixpkgs> { }";
        formatting.command = [ "alejandra" ];
        options = {
          nixos.expr = ''
            (builtins.getFlake "/home/rimv/nixconf").nixosConfigurations."laptop-dell".options
          '';
          home-manager.expr = ''
            (builtins.getFlake "/home/rimv/nixconf").nixosConfigurations."laptop-dell".options.home-manager.users.type.getSubOptions []
          '';
        };
      };
    };
  };

  # ── Bash ─────────────────────────────────────────────────────────
  bash-language-server.binary.path_lookup = true;

  # ── Elixir ───────────────────────────────────────────────────────
  elixir-ls = {
    binary.path_lookup = true;
    settings.dialyzerEnabled = true;
  };

  # ── C# / .NET (Roslyn) ───────────────────────────────────────────
  # Usamos path explícito de Nix porque el bundled del extension
  # es un ELF dinámico incompatible con NixOS (stub-ld).
  roslyn = {
    binary = {
      path = lib.getExe pkgs.roslyn-ls;
      arguments = [ "--stdio" ];
    };
    settings = {
      "csharp|inlay_hints" = {
        csharp_enable_inlay_hints_for_implicit_object_creation = true;
        csharp_enable_inlay_hints_for_implicit_variable_types = true;
        csharp_enable_inlay_hints_for_lambda_parameter_types = true;
        csharp_enable_inlay_hints_for_types = true;
        dotnet_enable_inlay_hints_for_parameters = true;
        dotnet_enable_inlay_hints_for_literal_parameters = true;
        dotnet_enable_inlay_hints_for_indexer_parameters = true;
        dotnet_enable_inlay_hints_for_object_creation_parameters = true;
        dotnet_enable_inlay_hints_for_other_parameters = true;
      };
      # Hover / documentación al hacer hover
      "csharp|quick_info" = {
        dotnet_show_remarks_in_quick_info = true;
      };
      "csharp|code_lens" = {
        dotnet_enable_references_code_lens = true;
        dotnet_enable_tests_code_lens = true;
      };
      "csharp|formatting" = {
        dotnet_organize_imports_on_format = true;
      };
      "csharp|completion" = {
        dotnet_provide_regex_completions = true;
        dotnet_show_completion_items_from_unimported_namespaces = true;
        dotnet_show_name_completion_suggestions = true;
      };
      "csharp|background_analysis" = {
        dotnet_analyzer_diagnostics_scope = "openFiles";
        dotnet_compiler_diagnostics_scope = "openFiles";
      };
      "csharp|navigation" = {
        dotnet_navigate_to_decompiled_sources = true;
        dotnet_navigate_to_source_link_and_embedded_sources = true;
      };
      "csharp|symbol_search" = {
        dotnet_search_reference_assemblies = true;
      };
    };
  };

  # ── Typst (tinymist) ────────────────────────────────────────────
  tinymist = {
    binary.path_lookup = true;
    settings = {
      exportPdf = "never";
      formatterMode = "typstyle";
      semanticTokens = "enable";
      outputPath = "$root/pdf/$name";
    };
  };

  # ── CSS / SCSS ───────────────────────────────────────────────────
  vscode-css-language-server = {
    binary.path_lookup = true;
    settings = {
      css = {
        validate = true;
        lint = {
          unknownAtRules = "ignore";
          duplicateProperties = "warning";
          emptyRules = "warning";
          zeroUnits = "warning";
          vendorPrefix = "warning";
        };
      };
      scss = {
        validate = true;
        lint.unknownAtRules = "ignore";
      };
      less.validate = true;
    };
  };

  # ── Tailwind CSS ───────────────────────────────────────────────────
  tailwindcss-language-server.binary.path_lookup = true;

  # ── Some Sass (SCSS/Sass) ─────────────────────────────────────────
  some-sass-language-server.binary.path_lookup = true;

  # ── SuperHTML (validación, formato, hover) ─────────────────────────
  superhtml.binary = {
    path_lookup = true;
    arguments = [ "lsp" ];
  };

  # ── Emmet ────────────────────────────────────────────────────────
  emmet-language-server.binary.path_lookup = true;
}
