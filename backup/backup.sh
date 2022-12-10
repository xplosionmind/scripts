#! /bin/bash

NAME="`date -u +%Y-%m-%d`_auto-backup";
DESCRIPTION="AUTOMATED BACKUP, created on `date -u +%Y-%m-%dT%H:%M:%SZ`";
REMOTE_DIR="/home/tommi/backup/server.tommi.space/latest";
ERROR_MSG="\n\n\t\t\e[1m\e[31mSOMETHING WENT WRONG\e[0m, aborting and exiting…\n\n";
ABORT="echo -e $ERROR_MSG";
LOG_FILE="/tmp/$NAME.log";

echo -e "\n\n\t**** \e[1mCREATING BACKUP NAMED \e[32m$NAME\e[0m ****\n\t\t$DESCRIPTION\n\n" >> $LOG_FILE;
sudo yunohost backup create -n "$NAME" -d "$DESCRIPTION" >> $LOG_FILE;

ssh tommi@backup.tommi.space -p 60213 'mv -vf /home/tommi/backup/server.tommi.space/latest/* /home/tommi/backup/server.tommi.space/old' >> $LOG_FILE;
echo -e "\n\n\t**** \e[1mMOVING $NAME\e[0m to backup.tommi.space ****\n\n" >> $LOG_FILE;
scp -P 60213 /home/yunohost.backup/archives/$NAME.* tommi@backup.tommi.space:"$REMOTE_DIR" >> $LOG_FILE ||\
	ssh tommi@backup.tommi.space -p 60213 'mv -vf /home/tommi/backup/server.tommi.space/old/* /home/tommi/backup/server.tommi.space/latest';
rm -rfv /home/yunohost.backup/archives/$NAME.* >> $LOG_FILE;
ssh tommi@backup.tommi.space -p 60213 'rm -rvf /home/tommi/backup/server.tommi.space/old/*' >> $LOG_FILE;

echo -e "\n\n\t**** \e[1mTHE END\e[0m ****\n\n" >> $LOG_FILE;

mailx -s "$NAME LOG" tommiboom+server@protonmail.com < $LOG_FILE;
