{
  "Elixir" = {
    language_servers = ["!lexical" "elixir-ls" "!next-ls"];
    format_on_save.external = {
      command = "mix";
      arguments = ["format" "--stdin-filename" "{buffer_path}" "-"];
    };
  };
  "HEEX" = {
    language_servers = ["!lexical" "elixir-ls" "!next-ls"];
    format_on_save.external = {
      command = "mix";
      arguments = ["format" "--stdin-filename" "{buffer_path}" "-"];
    };
  };
  "Python" = {
    language_servers = ["basedpyright" "ruff"];
    format_on_save.external = {
      command = "ruff";
      arguments = ["format" "--stdin-filename" "{buffer_path}" "-"];
    };
  };
  "Go".format_on_save.external = {
    command = "gofmt";
    arguments = ["-w" "{buffer_path}"];
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
    language_servers = ["superhtml"];
    format_on_save.external = {
      command = "prettier";
      arguments = ["--stdin-filepath" "{buffer_path}"];
    };
  };
  "Nix".format_on_save.external = {
    command = "alejandra";
    arguments = ["-"];
  };
  "C#".language_servers = ["roslyn"];
  "Rust".format_on_save.external = {
    command = "rustfmt";
    arguments = ["--edition" "2021"];
  };
}
