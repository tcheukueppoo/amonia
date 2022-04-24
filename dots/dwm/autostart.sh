#!/bin/sh

# set_wallpaper
# -------------
set_wallpaper ()
{
	test -x "$HOME/.fehbg" && . "$HOME/.fehbg"
}
set_wallpaper &

# set_outputs
# -----------
# set outputs x1, x2, ...., xn where xn is right of xn-1
set_outputs ()
{
	display=
	pdisplay=
	outputs=$( xrandr --listmonitors | tail -n +2 | awk -F[' *'] '{print $4}' | tr '\n' ':' )

	test -n "$outputs" || return
	pdisplay="${outputs%%:*}"
	xrandr --output "$pdisplay" --auto --rotate normal
	xrandr --output "$pdisplay" --brightness 0.80
	outputs="${outputs#*:}"
	if [ -n "$outputs" ]; then
		IFS=$':'
		for display in $outputs; do
			xrandr --output "$display" --auto --rotate normal --right-of "$pdisplay"
			xrandr --output "$display" --brightness 0.80
			pdisplay="$display"
		done
	fi
}
set_outputs &

command -v xcape && xcape -e 'F1=Escape'
