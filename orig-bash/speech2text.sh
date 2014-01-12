#!/bin/bash

echo "Recording ... Press CTRL-C to stop."

sox -r 16000 -t alsa "plughw:1,0" /dev/shm/out.flac silence 1 0.2 1% 1 0.5 3%
#wget -q -U "rate=16000" -O - --post-file /dev/shm/out.flac --header="Content-Type: audio/x-flac; rate=16000" "http://www.google.com/speech-api/v1/recognize?lang=en&client=Mozilla/5.0" | sed -e 's/[{}]/''/g'| awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]; exit }' | awk -F: 'NR==3 { print $3; exit }'
wget -q -U "rate=16000" -O - --post-file /dev/shm/out.flac --header="Content-Type: audio/x-flac; rate=16000" "http://www.google.com/speech-api/v1/recognize?lang=en&client=Mozilla/5.0" | sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]; exit }' | awk -F: 'NR==3 { print $3; exit }' >> Q.txt

rm /dev/shm/out.flac > /dev/null 2>&1
