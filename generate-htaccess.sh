#! /bin/bash

#for p in abc def ghi jkl xyz; do for i in {1..100}; do touch $p.$[ 0 + $[ RANDOM % 3 ]].$[ 0 + $[ RANDOM % 11 ]].nupkg; done; done
echo > .htaccess
for pkg in abc def ghi jkl xyz; do
  latest=$(ls $pkg.*.nupkg | sort --version-sort -r | head -1)
  echo RedirectMatch 302 ^package/$pkg/?$ packages/$latest >> .htaccess
done
