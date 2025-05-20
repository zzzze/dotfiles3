#!/usr/bin/env bash

set -e

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
pnpm env use --global lts
pnpm install -g nrm
nrm use taobao

# nvim
sudo apt install -y \
  neovim \
  fd-find \ # for nvim-telescope
  ripgrep \ # for nvim-telescope
cat >> $HOME/.bashrc <<EOF
export TERM=xterm-256color
export EDITOR=nvim
alias vim=nvim
alias vi=nvim
alias fd=fdfind
EOF

# tmux
sudo apt install -y tmux

# tmuxinator
sudo apt install -y ruby ruby-dev gem
gem install tmuxinator --user-install
echo "echo PATH=$PATH:`gem environment user_gemhome`" >> $HOME/.bashrc

# rust
# https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "export PATH=$PATH:~/.cargo/bin" >> $HOME/.bashrc
echo "source $HOME/.cargo/env" >> $HOME/.bashrc
# just
cargo install just

# git tools - tig | git-delta
## tig
git clone git://github.com/jonas/tig.git ~/code/tig
sudo apt-get install libncurses-dev # text user interface
make -C ~/code/tig
make install -C ~/code/tig
make install -C ~/code/tig
echo "export PATH=\$PATH:~/bin" >> $HOME/.bashrc
## git-delta
cargo install git-delta
