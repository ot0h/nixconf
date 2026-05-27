{ pkgs }: {
  list = with pkgs.tmuxPlugins; [
    vim-tmux-navigator
  ];

  statusBins = with pkgs; [
    procps
    acpi
  ];
}
