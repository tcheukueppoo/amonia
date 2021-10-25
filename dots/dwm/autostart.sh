#!/usr/bin/env sh

# set background image
backimg() {
	test -x "$HOME/.fehbg" && . "$HOME/.fehbg"
}

# starting conky
conk() {
	conkf="$HOME/.config/conky"
	if [ -d "$conkf" ]; then
		for i in "$conkf"; do
			test -f "$i" && conky -c "$i"
		done
	fi
}

# setting monitor(s)
output() {
	local outputs="$(xrandr --query | fgrep ' connected ' | \
		sed -nE 's/([-[:alnum:]]+).*/\1/p')"
	local nout=$(echo "$outputs" | wc -l)
	
	# only change gamma if there's only one monitor
	if [ $nout -eq 1 ]; then
		xrandr --output "$outputs" --brightness 0.6
		return
	fi
	local out
	local prev
	local cont=true
	echo "$outputs" | \
	while read out; do
		if [ $cont = false ]; then
			xrandr --output $out --auto --rotate normal \
				--right-of $prev
		else
			xrandr --output $out --auto --rotate normal
			cont=false
		fi
		prev="$out"
	done
	# set brightness
	# command -v xbacklight && xbacklight -set 40
}

output &
conk &
backimg &
