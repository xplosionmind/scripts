#!/usr/bin/env zsh

REPO="$HOME/tommi.space";

echo -e "\n\n Bang has started\nnow building tommi.space…";
cd "$REPO";
npm run build && \
titan && \
echo -e "\n\033[1;32mbuild successful\033[0m\n\nNow synchronizing with Xplosion Server…\n" && \
rsync -avzP -e 'ssh -p 50002' --delete ~/tommi.space/www/ admin@server.tommi.space:/home/admin/www.tmp/ && \
echo -e "\n\033[1;32mtransfer successful\033[0m\n\nNow publishing…\n" && \
ssh server 'sudo rsync -azP --delete /home/admin/www.tmp/gemini/ /opt/yunohost/gemserv/tommi.space/ && \
	rm -rf /home/admin/www.tmp/gemini && \
	sudo yunohost service restart gemserv && \
	echo -e "\033[1;32mSUCCESS\033[0m — gemini://tommi.space published";
	sudo rsync -azP --delete /home/admin/www.tmp/ /var/www/my_webapp/www/' && \
echo -e "\n\033[1;32mSUCCESS — everything has been published\033[0m\n\n";