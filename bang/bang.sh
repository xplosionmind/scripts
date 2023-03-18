#!/usr/bin/env zsh

REPO="$HOME/tommi.space";
hr="――――――――――――――――――――――――――――――――――――――――――";
dhr="==========================================";

echo -e "$dhr\nBang has started\nnow building tommi.space…\n$hr";
cd "$REPO";
npm run build || npm run build && \
titan && \
echo -e "\033[1;32mbuild successful\033[0m\n\nNow synchronizing with Xplosion Server…\n$hr" && \
rsync -avzP -e "ssh -p $SERVER_PORT" --delete ~/tommi.space/www/ tommi@server.tommi.space:/home/tommi/www.tmp/ && \
echo -e "$hr\n\033[1;32mtransfer successful\033[0m\nNow publishing…\n$hr" && \
ssh server \
	'sudo cp -rf /home/tommi/www.tmp/gemini/ /opt/yunohost/gemserv/tommi.space/ && \
	rm -rf /home/tommi/www.tmp/gemini && \
	sudo yunohost service restart gemserv && \
	echo -e "$hr\033[1;32mSUCCESS\033[0m — gemini://tommi.space published\n$hr" && \
	sudo cp -Rf /home/tommi/www.tmp/* /var/www/my_webapp/www/' && \
echo -e "$hr\n\033[1;32mSUCCESS: everything has been published!\033[0m\n$dhr" || echo -e "$hr\n\033[1;32mFAILURE: something went wrong.\033[0m\n$dhr";