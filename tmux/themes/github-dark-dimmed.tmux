#!/usr/bin/env bash
# GitHub Dark Dimmed for Tmux

set -g mode-style "fg=#22272e,bg=#adbac7"
set -g message-style "fg=#22272e,bg=#adbac7"
set -g message-command-style "fg=#22272e,bg=#adbac7"

set -g pane-border-style "fg=#3d444d"
set -g pane-active-border-style "fg=#539bf5"

set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#adbac7,bg=#1c2128"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#1c2128,bg=#539bf5,bold] #S #[fg=#539bf5,bg=#1c2128,nobold,nounderscore,noitalics]"

set -g status-right "#[fg=#1c2128,bg=#1c2128,nobold,nounderscore,noitalics]#[fg=#539bf5,bg=#1c2128] #{prefix_highlight} #[fg=#adbac7,bg=#1c2128,nobold,nounderscore,noitalics]#[fg=#22272e,bg=#adbac7] %Y-%m-%d  %I:%M %p #[fg=#539bf5,bg=#adbac7,nobold,nounderscore,noitalics] #{tmux_mode_indicator}"

setw -g window-status-activity-style "underscore,fg=#768390,bg=#1c2128"

setw -g window-status-separator ""

setw -g window-status-style "NONE,fg=#768390,bg=#1c2128"

setw -g window-status-format "#[fg=#1c2128,bg=#1c2128,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#1c2128,bg=#1c2128,nobold,nounderscore,noitalics]"

setw -g window-status-current-format "#[fg=#1c2128,bg=#adbac7,nobold,nounderscore,noitalics]#[fg=#22272e,bg=#adbac7,bold] #I  #W #F #[fg=#adbac7,bg=#1c2128,nobold,nounderscore,noitalics]"
