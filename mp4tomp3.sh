#!/bin/bash
# converts all mp4 files in a directory to mp3
if [ $# -eq 0 ]; then
	FOLDER=$(pwd)
else
	FOLDER=$1
fi
MP4FILES=$(ls $FOLDER | grep .mp4)
FILE=''
for l in $MP4FILES
do
	case $l in
		*.mp4)
			FILE+=' '$l
			NFILE=${FILE%.mp4}.mp3
			ffmpeg -i "$FOLDER/$FILE" "$FOLDER/$NFILE" # -b:a 192K -vn
			FILE=''
		;;
		*)
			if [ -z "$FILE" ]; then
				FILE=$l
			else
				FILE+=' '$l
			fi
		;;
	esac
done
echo "rm $PWD/*.mp4 to remove the videos!"
