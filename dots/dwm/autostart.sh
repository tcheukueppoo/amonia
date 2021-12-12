#!/usr/bin/env sh

# setting monitor(s), there's is a condition because they may
# be one monitor.
outputs="$(xrandr --query | fgrep ' connected ' | \
			sed -n 's/\([-[:alnum:]]\+\).*/\1/p')"

# don't set anything if there's only one monitor
if test $(echo "$outputs" | wc -l) != 1; then
	first=true
	echo "$outputs" | \
	while read out; do
		if test $first = false; then
			xrandr --output $out --auto --rotate \
				normal --right-of $prev
		else
			xrandr --output $out --auto --rotate normal
			first=false
		fi
		prev="$out"
	done
else
	xrandr --output $outputs --brightness 0.8
fi

# set brightness
# command -v xbacklight && xbacklight -set 40

# set background image
command -v feh && test -f "$HOME"/.background \
&& feh --bg-fill "$HOME"/.background 

# starting conky
conkf="$HOME/.config/conky"
if test -d $conkf; then
	for i in $conkf; do
		test -f "$i" && conky -c "$i"
	done
fi
