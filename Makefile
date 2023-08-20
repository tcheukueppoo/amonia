
CONF = ~/.config

install:
	mkdir -p $(CONF)
	mkdir -p $(CONF)/zathura
	mkdir -p ~/.dwm
	cp -f dots/bash/bashrc        ~/.bashrc
	cp -f dots/bash/bashrc0       ~/.bashrc0
	cp -f dots/bash/inputrc       ~/.inputrc
	cp -f dots/dict/dictrc        ~/.dictrc
	cp -f dots/tmux/tmux.conf     ~/.tmux.conf
	cp -f dots/xorg/autostart-wm  ~/.dwm/
	cp -f dots/xorg/xinitrc       ~/.xinitrc
	cp -f dots/xorg/Xresources    ~/.Xresources
	cp -f dots/zathura/zathurarc  $(CONF)/zathura/zathurarc

uninstall:
	rm -f \
		~/.bashrc  \
		~/.bashrc0 \
		~/.inputrc \
		~/.dictrc \
		~/.tmux.conf \
		~/.dwm/autostart-wm \
		~/.xinitrc \
		~/.Xresources \
		$(CONF)/zathura/zathurarc

