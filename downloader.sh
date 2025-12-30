#!/bin/bash

URL="$1"

if [ -z "$URL" ]; then
  echo "Usage: ./downloader.sh <youtube-url>"
  exit 1
fi

yt-dlp \
-f "bv*[ext=mp4][vcodec^=avc1][height<=1080]+ba[ext=m4a]/bv*+ba" \
--merge-output-format mp4 \
--write-subs \
--write-auto-subs \
--sub-lang en \
--sub-format srt \
--embed-subs \
--add-metadata \
--postprocessor-args "ffmpeg:-metadata title=JiNN" \
-o "%(title)s.%(ext)s" \
"$URL"
