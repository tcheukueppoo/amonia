#!/bin/sh

# This script should not be runned directly

if [ -f "/etc/alpine-release" ] ; then
   run_as='doas'
elif [ -f "/etc/arch-release" ] ; then
   run_as='sudo'
fi

clone_build_install () {
   while [ 1 ] ; do
      test -d $2                     \
         || git clone --depth 1 "$1"  \
         || continue   

      test -d $2 || continue
      cd -L $2               \
        && make               \
        && ${run_as} make install   \
        && make clean
      cd ..
      break
   done
}

install_custom_software () {
   tcheukueppo='https://codeberg.org/tcheukueppo'

   mkdir -p ~/projects && cd ~/projects

   for r in kst   \
            kdwm   \
            ksent   \
            kdmenu   \
            kslock    \
            kslstatus  \
            herbe       \
            amonia       \
            ktoolbox      \
            wfmux ; do
      clone_build_install "$tcheukueppo/$r" $r
   done
}
   
font_config () {
   tag=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r .tag_name)
   ubuntu_mono="https://github.com/ryanoasis/nerd-fonts/releases/download/$tag/UbuntuMono.tar.xz"

   mkdir -p ~/.local/share/fonts/ubuntu_mono && cd ~/.local/share/fonts/ubuntu_mono

   test -f UbuntuMono.tar.xz      \
     || wget "$ubuntu_mono"        \
     && tar -xf UbuntuMono.tar.xz   \
     && fc-cache
}


xorg_config () { setxkbmap fr; }

vim_config () {
   vim_plug='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

   mkdir -p ~/.vim/swaps
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs "$vim_plug"
   vim -c PlugInstall -c q -c q 
}

git_config () {
   git config --global init.defaultBranch main
   git config --global user.name tcheukueppo
   git config --global user.email tcheukueppo@yandex.com
}

main () {
   install_custom_software
   font_config
   xorg_config
   vim_config
   git_config
}

main
