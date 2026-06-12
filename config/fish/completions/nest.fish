# NestJS CLI completions for Fish shell

# Disable file completions for nest
complete -c nest -f

# Top-level commands
complete -c nest -n "__fish_use_subcommand" -a "new"       -d "Generate Nest application"
complete -c nest -n "__fish_use_subcommand" -a "build"     -d "Build Nest application"
complete -c nest -n "__fish_use_subcommand" -a "start"     -d "Run Nest application"
complete -c nest -n "__fish_use_subcommand" -a "info"      -d "Display Nest project details"
complete -c nest -n "__fish_use_subcommand" -a "add"       -d "Add external library"
complete -c nest -n "__fish_use_subcommand" -a "generate"  -d "Generate a Nest element"
complete -c nest -n "__fish_use_subcommand" -a "g"         -d "Generate a Nest element (alias)"

# Schematics for generate / g
set -l schematics "application class configuration controller decorator filter gateway guard interceptor interface library middleware module pipe provider resolver resource service sub-app"

for s in $schematics
    complete -c nest -n "__fish_seen_subcommand_from generate g" -a $s
end

# Aliases for schematics
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "cl"  -d "class"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "co"  -d "controller"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "d"   -d "decorator"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "f"   -d "filter"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "ga"  -d "gateway"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "gu"  -d "guard"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "itc" -d "interceptor"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "itf" -d "interface"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "lib" -d "library"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "mi"  -d "middleware"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "mo"  -d "module"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "pi"  -d "pipe"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "pr"  -d "provider"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "r"   -d "resolver"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "res" -d "resource"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "s"   -d "service"
complete -c nest -n "__fish_seen_subcommand_from generate g" -a "app" -d "sub-app"

# Global options
complete -c nest -s v -l version -d "Output current version"
complete -c nest -s h -l help    -d "Output usage information"

# generate options
complete -c nest -n "__fish_seen_subcommand_from generate g" -s d -l dry-run   -d "Dry run (no files written)"
complete -c nest -n "__fish_seen_subcommand_from generate g" -s p -l project   -d "Project name"
complete -c nest -n "__fish_seen_subcommand_from generate g"      -l flat       -d "No folder for element"
complete -c nest -n "__fish_seen_subcommand_from generate g"      -l no-spec    -d "Skip spec file"
complete -c nest -n "__fish_seen_subcommand_from generate g"      -l spec       -d "Generate spec file"
complete -c nest -n "__fish_seen_subcommand_from generate g" -s c -l collection -d "Schematics collection"

# build options
complete -c nest -n "__fish_seen_subcommand_from build" -s w -l watch        -d "Watch mode"
complete -c nest -n "__fish_seen_subcommand_from build"      -l webpack       -d "Use webpack"
complete -c nest -n "__fish_seen_subcommand_from build"      -l webpackPath   -d "Path to webpack config"
complete -c nest -n "__fish_seen_subcommand_from build"      -l tsc           -d "Use tsc"
complete -c nest -n "__fish_seen_subcommand_from build" -s c -l config        -d "Path to nest-cli.json"

# start options
complete -c nest -n "__fish_seen_subcommand_from start" -s w -l watch      -d "Watch mode"
complete -c nest -n "__fish_seen_subcommand_from start" -s d -l debug      -d "Debug mode"
complete -c nest -n "__fish_seen_subcommand_from start"      -l watchAssets -d "Watch non-TS assets"
complete -c nest -n "__fish_seen_subcommand_from start" -s c -l config     -d "Path to nest-cli.json"
