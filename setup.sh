#!/usr/bin/env bash

# Installing RVM and Ruby
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
curl -sSL https://get.rvm.io | bash -s $1
echo source /home/vagrant/.rvm/scripts/rvm >> ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm install 2.0.0
rvm use --default 2.0.0
gem install zeus
rvm rvmrc warning ignore allGemfiles

# Enabling geo-location apt-mirrors
sed -i '1s/^/deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse\n/' /etc/apt/sources.list
sed -i '1s/^/deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse\n/' /etc/apt/sources.list
sed -i '1s/^/deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse\n/' /etc/apt/sources.list
sed -i '1s/^/deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse\n/' /etc/apt/sources.list

# Git Configurations
git config --global color.ui true
git config --global pull.default current
git config --global push.default current
git config --global user.name "Thales Mello"
git config --global user.email thalesmello@gmail.com

echo --color >> ~/.rspec
echo --format progress >> ~/.rspec
sed -i '1s/^/force_color_prompt=yes\n/' ~/.bashrc

# Config git lg
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Aliases
echo alias gs=\'git status\' >> ~/.bashrc
echo alias ga=\'git add\' >> ~/.bashrc
echo alias gb=\'git branch\' >> ~/.bashrc
echo alias gc=\'git commit\' >> ~/.bashrc
echo alias gd=\'git diff\' >> ~/.bashrc
echo alias go=\'git checkout\' >> ~/.bashrc
echo alias gm=\'git commit -m\' >> ~/.bashrc
echo alias gl=\'git lg\' >> ~/.bashrc
echo alias be=\'bundle exec\' >> ~/.bashrc
echo alias zc=\'zeus console\' >> ~/.bashrc
echo alias zs=\'zeus server\' >> ~/.bashrc
echo alias zt=\'zeus test\' >> ~/.bashrc
echo alias zr=\'zeus rake\' >> ~/.bashrc
echo alias mag=\'cd ~/magnetis\' >> ~/.bashrc
echo mag >> ~/.bashrc

# Jspec function
echo "jspec() { local spec=\`echo $1 | sed 's_spec/javascripts/__' | sed 's_.js__'\`;  zeus rake konacha:run SPEC=\$spec; }" >> ~/.bashrc
