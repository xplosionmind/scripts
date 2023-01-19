#!/usr/bin/env zsh

cd ~/tommi.space;
npm run build && \
rsync -avzP -e 'ssh -p 50002' --delete ~/tommi.space/www/ admin@server.tommi.space:/home/admin/www.tmp/ && \
ssh server 'sudo rm -rf /var/www/my_webapp/www && sudo cp -rvf /home/admin/www.tmp/ /var/www/my_webapp/www' && \
echo -e "\033[1;32mSUCCESS\!\033[0m";