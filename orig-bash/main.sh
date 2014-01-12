#!/bin/bash

$GREETING = cat Greetings.voc | sort -R | head -n 1

./text2speech.sh $GREETING
sleep .1
./speech2text.sh

QUESTION=$(cat Q.txt)

echo "Me: ", $QUESTION

ANSWER=$(python queryprocess.py $QUESTION)
echo "Robot: ", $ANSWER

./text2speech.sh $ANSWER

/bin/rm Q.txt
