#! /bin/bash

# titan, a script by Tommi
# https://tommi.space/scripts/titan 👀

urlencode() {
	# urlencode <string>

	old_lc_collate=$LC_COLLATE
	LC_COLLATE=C

	local length="${#1}"
	for (( i = 0; i < length; i++ )); do
		local c="${1:$i:1}"
		case $c in
			[a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
			*) printf '%%%02X' "'$c" ;;
		esac
	done

	LC_COLLATE=$old_lc_collate
}

BASE_URL='gemini://tommi.space';
SRC="$HOME/tommi.space/gemini";
LOCAL_OUTPUT="$HOME/tommi.space/www/gemini";

echo -e "\n\nRunning Titan:\ngenerating tommi.space Gemini capsule…\n";

rm -rf "$LOCAL_OUTPUT" && \
mkdir "$LOCAL_OUTPUT";
cp -R "$SRC"/ "$LOCAL_OUTPUT";
mv "$LOCAL_OUTPUT"/it/marmellata.gmi "$LOCAL_OUTPUT"/marmellata.gmi;
mv "$LOCAL_OUTPUT"/it/zibaldone.gmi "$LOCAL_OUTPUT"/zibaldone.gmi;
md2gemini -f -p -l copy -m -b "$BASE_URL" "$HOME"/tommi.space/scripts/titan/README.md >> "$LOCAL_OUTPUT"/titan.gmi;

cd ~/tommi.space/content/posts;
for f in `ls -r *.md`; do
	title=`basename -s .md "$f"`;
	encoded_title=`urlencode "$title"`;

	md2gemini "$f" -w -d "$LOCAL_OUTPUT" -f -p -l copy -m -b "$BASE_URL";
	if grep -q 'lang: en' "$f"; then
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇬🇧" >> "$LOCAL_OUTPUT"/blog.gmi;
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇬🇧" >> "$LOCAL_OUTPUT"/zibaldone.gmi;
	elif grep -q 'lang: fr' "$f"; then
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇫🇷" >> "$LOCAL_OUTPUT"/blog.gmi;
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇫🇷" >> "$LOCAL_OUTPUT"/zibaldone.gmi;
	else
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇮🇹" >> "$LOCAL_OUTPUT"/blog.gmi;
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇮🇹" >> "$LOCAL_OUTPUT"/zibaldone.gmi;
	fi
done
echo 'The Gemini Zibaldone has been parsed.';

cd ~/tommi.space/content/notes/public;
ls -1Ut *.md > "$LOCAL_OUTPUT"/jam-list.txt;
while read f; do
	title=`basename -s .md "$f"`;
	encoded_title=`urlencode "$title"`;

	md2gemini "$f" -w -d "$LOCAL_OUTPUT" -f -p -l copy -m -b "$BASE_URL";
	if grep -q 'lang: it' "$f"; then
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇮🇹" >> "$LOCAL_OUTPUT"/jam.gmi;
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇮🇹" >> "$LOCAL_OUTPUT"/marmellata.gmi;
	elif grep -q 'lang: fr' "$f"; then
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇫🇷" >> "$LOCAL_OUTPUT"/jam.gmi;
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇫🇷" >> "$LOCAL_OUTPUT"/marmellata.gmi;
	else
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇬🇧" >> "$LOCAL_OUTPUT"/jam.gmi;
		echo -e "=> $BASE_URL/$encoded_title.gmi $title 🇬🇧" >> "$LOCAL_OUTPUT"/marmellata.gmi;
	fi
done < "$LOCAL_OUTPUT"/jam-list.txt;
echo 'The Gemini Jam has been parsed.';

echo -e "\033[1;32mSUCCESS\033[0m: gemini://tommi.space generated\n\n";