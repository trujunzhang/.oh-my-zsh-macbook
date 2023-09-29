# https://rvm.io/rvm/install


# As a first step install GPG keys used to verify installation package:

gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Installing the stable release version:

\curl -sSL https://get.rvm.io | bash -s stable


# https://rvm.io/integration/fish

curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish

echo "rvm default" >> ~/.config/fish/config.fish


rvm install 3.0.6





