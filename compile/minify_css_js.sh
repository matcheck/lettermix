#!/bin/bash
set -e

for d in {css,js}
do
cd ../$d
for f in *.$d
do
[[ -f `basename $f .$d`.min.$d ]] && continue # if x.js, skip if x.min.js already exists
[[ $f =~ min.$d ]] && continue # if x.min.js, skip
echo minifying $f
java -jar ../compile/yuicompressor-2.4.8.jar $f > `basename $f .$d`.min.$d
done
done
