#!/bin/bash

while getopts "l:c:t:s:" flag; do
	case "${flag}" in
		l) LUASCRIPT=${OPTARG};;
		c) CHECKPOINT=${OPTARG};;
		t) TEMPERATURE=${OPTARG};;
		s) SUPPRESS=${OPTARG};;
	esac
done

echo $LUASCRIPT
echo $CHECKPOINT
echo $TEMPERATURE
echo $SUPPRESS

docker run --rm -it \
	--volume ./models/:/models \
	torchrnn \
	/root/torch/install/bin/th /root/torch-rnn/$LUASCRIPT \
	-gpu -1 \
	-checkpoint /models/$CHECKPOINT \
	-suppress $SUPPRESS \
	-temperature $TEMPERATURE 
