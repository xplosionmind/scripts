#! /bin/bash

#########################################
#                                       #
#   BACKUP SCRIPT FOR XPLOSION SERVER   #
#   https://tommi.space/scripts/backup  #
#       licensed with EUPL v. 1.2       #
#                                       #
#########################################

# NOTE: $BACKUP_PORT is a hidden global environment variable

NAME="`date -u +%Y-%m-%d`_auto-backup";
DESCRIPTION="AUTOMATED BACKUP, created on `date -u +%Y-%m-%dT%H:%M:%SZ`";
LOCAL_DIR="/home/yunohost.backup/archives/";
REMOTE_DIR="/home/tommi/backup/server.tommi.space/auto/";
FAIL=false;
hr="――――――――――――――――――――――――――――――――――――――――――"
dhr="==========================================";

# Creating the backup
echo -e "$dhr\n`date -u +%Y-%m-%dT%H:%M:%SZ`:\tCREATING BACKUP\n$hr";
sudo systemctl stop gitea.service || FAIL=true;
sudo yunohost backup create -n "$NAME" -d "$DESCRIPTION" || FAIL=true;
sudo systemctl start gitea.service || FAIL=true;

# Syncing the backup
echo -e "\n\n`date -u +%Y-%m-%dT%H:%M:%SZ`:$hr\nBACKUP CREATED!\n$hr\nnow starting rsync transfer…\n$hr";
rsync -az -e "ssh -p $BACKUP_PORT" --delete "$LOCAL_DIR" tommi@backup.tommi.space:"$REMOTE_DIR" && \
cd "$LOCAL_DIR" && rm -rf ./* || FAIL=true; # deleting the backup locally

if [ "$FAIL" = false ] ; then
	echo -e "$hr\n`date -u +%Y-%m-%dT%H:%M:%SZ`:\tSUCCESS! — THE END\n$dhr";
else
	echo -e "$hr\n`date -u +%Y-%m-%dT%H:%M:%SZ`:\tFAILURE!\n$dhr";
fi