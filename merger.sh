#!/bin/bash

if [ ! -d "/src" ]; then
  # Take action if $DIR exists. #
  echo "Please provide a source folder"
  exit
fi

if [ ! -d "/dst" ]; then
  # Take action if $DIR exists. #
  echo "Please provide a destination folder"
  exit
fi

cd /src
while true
do
	files=( $(ls *.pdf 2>/dev/null))
	if [[ "${#files[@]}" -ge 2 ]]; then
		duplex_file="${files[0]%.pdf}_${files[1]%.pdf}.pdf"
    echo "Transforming ${files[0]} and ${files[1]} into $duplex_file"
		pdftk A=${files[0]} B=${files[1]} shuffle A Bend-1 output ${duplex_file}
		rm -f ${files[0]}
		rm -f ${files[1]}
    chmod ugo+rw ${duplex_file}
		mv ${duplex_file} /dst
	fi
	sleep 5
done
