#!/bin/bash
say() { echo "$*" | sed -e 's/[{}]/''/g' | sed -e 's/|/./g' | festival --tts; }
say $*
