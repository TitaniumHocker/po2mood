#!/usr/bin/env bash
# po2mood tmux theme. Colors mirror lua/po2mood/palette.lua.

bg='#dedcd8'
bg_alt='#cccac4'
border='#a19c90'
comment='#595446'
fg='#444136'
green='#2c633f'
blue='#3c5a89'
gold='#645826'

tmux set -g status-style "fg=$fg,bg=$bg_alt" \; \
  set -g status-left-style "fg=$bg,bg=$fg" \; \
  set -g status-right-style "fg=$fg,bg=$bg_alt" \; \
  set -g window-status-style "fg=$comment,bg=$bg_alt" \; \
  set -g window-status-current-style "fg=$bg,bg=$green" \; \
  set -g window-status-activity-style "fg=$gold,bg=$bg_alt" \; \
  set -g window-status-bell-style "fg=$bg,bg=$gold" \; \
  set -g pane-border-style "fg=$border" \; \
  set -g pane-active-border-style "fg=$green" \; \
  set -g message-style "fg=$bg,bg=$fg" \; \
  set -g message-command-style "fg=$bg,bg=$fg" \; \
  set -g mode-style "fg=$bg,bg=$blue" \; \
  set -g copy-mode-match-style "fg=$bg,bg=$gold" \; \
  set -g copy-mode-current-match-style "fg=$bg,bg=$blue" \; \
  set -g display-panes-colour "$comment" \; \
  set -g display-panes-active-colour "$green" \; \
  set -g clock-mode-colour "$green"
