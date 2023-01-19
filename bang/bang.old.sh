#!/usr/bin/env zsh

rsync -avzP -e 'ssh -p 50002' --delete ~/tommi.space/assets/ admin@server.tommi.space:~/tommi.space/assets/
cd ~/tommi.space;
git push --recurse-submodules=on-demand;
ssh server 'boom';