CONF = ~/.config

install:
	mkdir -p $(CONF)
	mkdir -p $(CONF)/zathura
	mkdir -p $(CONF)/conky
	mkdir -p ~/.vim/colors
	mkdir -p ~/.dwm
	mkdir -p ~/.mpd
	mkdir -p ~/.mpd/playlists
	touch    ~/.mpd/database
	mkdir -p ~/.ncmpcpp
	cp -f dots/bash/profile              ~/.profile
	cp -f dots/bash/bashrc               ~/.bashrc
	cp -f dots/bash/bashrc0              ~/.bashrc0
	cp -f dots/bash/inputrc              ~/.inputrc
	cp -f dots/dict/dictrc               ~/.dictrc
	cp -f dots/vim/vimrc                 ~/.vimrc
	cp -f dots/vim/*.vim                 ~/.vim/colors/
	cp -f dots/zathura/zathurarc         $(CONF)/zathura/zathurarc
	cp -f dots/conky/conkyrc_2           $(CONF)/conky/conky.conf
	cp -f dots/tmux/tmux.conf            ~/.tmux.conf
	cp -f wallpaper/fractal_img.png      ~/.bg
	cp -f dots/xorg/autostart-wm         ~/.dwm/autostart.sh
	cp -f dots/xorg/xinitrc              ~/.xinitrc
	cp -f dots/xorg/Xresources           ~/.Xresources
	cp -f dots/mpd/mpd.conf              ~/.mpd/
	cp -f dots/ncmpcpp/config            ~/.ncmpcpp/
	xrdb ~/.Xresources

uninstall:
	rm -f \
	   ~/.bashrc  \
	   ~/.bashrc0 \
	   ~/.inputrc \
	   ~/.dictrc \
	   ~/.tmux.conf \
	   ~/.dwm/autostart.sh \
	   ~/.xinitrc \
	   ~/.Xresources \
	   ~/.vimrc \
	   ~/.vimrc/vim/colors/*.vim \
		~/.mpd/mpd.conf \
		~/.ncmpcpp/config \
	   $(CONF)/zathura/zathurarc \
		$(CONF)/conky/conky.conf
