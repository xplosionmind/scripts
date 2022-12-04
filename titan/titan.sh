#! /bin/bash

# Deploy Gemini website
BASE_URL='gemini://tommi.space';

mkdir /tmp/tommi.space;
mkdir /tmp/tommi.space/gemini;
cp /home/admin/tommi.space/gemini/* /tmp/tommi.space/gemini/ -vf;

cd /home/admin/tommi.space/content/posts;
for f in *.md; do
	filename=$(basename -- "$f")
	extension="${filename##*.}"
	filename="${filename%.*}"
	md2gemini "$f" -w -f -p -l copy -m -b "$BASE_URL";
	echo -e "=> $BASE_URL/$filename.gmi $filename" >> /tmp/tommi.space/gemini/zibaldone.gmi;
done
sudo mv /home/admin/tommi.space/content/posts/*.gmi /opt/yunohost/gemserv/tommi.space/ -vf;
echo 'Zibaldone has been parsed.';

cd /home/admin/tommi.space/content/notes/public;
for f in *.md; do
	filename=$(basename -- "$f")
	extension="${filename##*.}"
	filename="${filename%.*}"
	md2gemini "$f" -w -f -p -l copy -m -b 'https://tommi.space/';
	echo -e "=> $BASE_URL/$filename.gmi $filename" >> /tmp/tommi.space/gemini/jam.gmi;
done
sudo mv /home/admin/tommi.space/content/notes/public/*.gmi /opt/yunohost/gemserv/tommi.space/ -vf;
echo 'The Jam has been parsed.';

sudo cp /tmp/tommi.space/gemini/* /opt/yunohost/gemserv/tommi.space/ -vf;
sudo yunohost service restart gemserv;
