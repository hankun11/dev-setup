# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|screen*) color_prompt=yes;;
esac

alias ll='ls -lG'
