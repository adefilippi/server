#!/bin/bash
apt install -y build-essential
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source /root/.bashrc
chmod u+x  ~/.nvm/nvm.sh
~/.nvm/nvm.sh install 16