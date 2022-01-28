#!/bin/sh
#
# See License file for copyright and license details.

func_set_wallpaper ()
{
	test -x "$HOME/.fehbg" && . "$HOME/.fehbg"
}

func_set_outputs ()
{
	display=
	pdisplay=
	outputs=$( xrandr --listmonitors | tail -n +2 | awk -F[' *'] '{print $4}' | tr '\n' ':' )

	test -z "$outputs" && return
	pdisplay="${outputs%%:*}"
	xrandr --output "$pdisplay" --auto --rotate normal
	xrandr --output "$pdisplay" --brightness 0.85
	outputs="${outputs#*:}"
	if test -n "$outputs"; then
		IFS=$':'
		for display in $outputs; do
			xrandr --output "$display" --auto --rotate normal --right-of "$pdisplay"
			xrandr --output "$display" --brightness 0.85
			pdisplay="$display"
		done
	fi
}

func_run_conky ()
{
	conk_theme=
	conkfigs="$HOME/.config/conky"

	for conk_theme in "$conkfigs"; do
		test -f "$conk_theme" && conky -c "$conk_theme"
	done
}

# The order is significant and the success of one function
# may depend its previous one, so No Need to put them in
# backgroud else it may have some annoying visual effects.
{
	func_set_outputs
	func_set_wallpaper
	func_run_conky
}
