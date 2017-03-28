#!/bin/bash

for f in *circuit*.dot
do
	dot -Tpng $f -o $f.png
done
