#!/usr/bin/bash
cd nonfaces
wget -erobots=off -r -l2 -nd -Nc -A.tar -R faces.tar http://www.robots.ox.ac.uk/~vgg/data3.html
rm faces.tar 
files=*.tar 
for f in $files
do
  prefix=$(echo $f | cut -d '.' -f 1)
  mkdir -p $prefix
  tar xf $f -C $prefix
  cd $prefix
  newfiles=$(find . -type f -printf "%f\n")
  cd ..
  for newfile in $newfiles
  do
    echo $newfile
    mv "$prefix/$newfile" "$prefix""_""$newfile"
  done 
  rmdir $prefix
done
