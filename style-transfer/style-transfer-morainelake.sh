#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
pushd $BASEDIR/fast-style-transfer/ > /dev/null

infile=../input/morainelake.jpg
for ckptfile in ../ckpt/*.ckpt; do
	outfile=../output/morainelake-$(basename $ckptfile .ckpt).jpg
	echo "Rendering $infile using $ckptfile..."
	python evaluate.py --checkpoint $ckptfile --in-path $infile  --out-path $outfile
	echo "Done!"
done

popd > /dev/null
