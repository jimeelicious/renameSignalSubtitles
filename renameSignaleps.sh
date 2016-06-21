#!/bin/bash
# This script is specifically built for Signal
# Renames .srt files to its corresponding .mp4/.mkv names

# Modify lines 16, 19, & 24 to customize for others

# Leave spaces in dir as is, if any (do not escape), within quotes
dir="/example path/to/folder"
lastep=16
ep=`seq -w 1 $lastep`


cd "$dir"

for num in $ep; do
 if ls *E"$num"* &>/dev/null; then
   # Obtains movie file without extension
   # base=${movie::-4} works as well
   movie=`ls *E"$num"*.m?? 2>/dev/null`
   base=${movie%.???}

   # Renames subtitles to match movie file
   echo -e "Renaming episode $num subtitles --> \"$base.srt\""
   mv -n *E"$num"*.srt "$base".srt 2>/dev/null
 else
   echo \[ERROR\] Episode $num was not found. Exiting script.
   exit 1
 fi
done
