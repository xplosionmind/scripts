#!/usr/bin/env zsh

cd ~/tommi.space;
git push --recurse-submodules=on-demand;
ssh server 'boom';