{
  "Python" = {
    language_servers = ["basedpyright" "ruff"];
    format_on_save.external = {
      command = "ruff";
      arguments = ["format" "--stdin-filename" "{buffer_path}" "-"];
    };
  };
  "Go" = {
    language_servers = ["gopls"];
    format_on_save.external = {
      command = "gofmt";
      arguments = ["-w" "{buffer_path}"];
    };
  };
  "Fish" = {
    language_servers = ["fish-lsp"];
    format_on_save.external = {
      command = "fish_indent";
      arguments = ["--read" "{buffer_path}" "-"];
    };
  };
  "TypeScript".format_on_save.external = {
    command = "prettier";
    arguments = ["--stdin-filepath" "{buffer_path}"];
  };
  "JavaScript".format_on_save.external = {
    command = "prettier";
    arguments = ["--stdin-filepath" "{buffer_path}"];
  };
  "CSS" = {
    language_servers = ["vscode-css-language-server" "tailwindcss-language-server"];
    format_on_save.external = {
      command = "prettier";
      arguments = ["--stdin-filepath" "{buffer_path}"];
    };
  };
  "SCSS".language_servers = ["vscode-css-language-server" "tailwindcss-language-server" "some-sass-language-server"];
  "HTML" = {
    language_servers = ["vscode-css-language-server"];
    format_on_save.external = {
      command = "prettier";
      arguments = ["--stdin-filepath" "{buffer_path}"];
    };
  };
  "Nix" = {
    language_servers = ["nil"];
    format_on_save.external = {
      command = "alejandra";
      arguments = ["-"];
    };
  };
  "C#".language_servers = ["roslyn"];
  "Rust".format_on_save.external = {
    command = "rustfmt";
    arguments = ["--edition" "2021"];
  };
}
