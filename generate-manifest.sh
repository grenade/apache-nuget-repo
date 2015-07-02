#!/bin/bash

# https://gist.github.com/grenade/b4f11aa5080f9f5209f4

#for pkg in nxlog git.install; do
#  echo $pkg
#  curl -L http://chocolatey.org/api/v2/package/$pkg -o $pkg.nupkg
#done
unzip "*.nupkg" "*.nuspec"
xsltproc transform.xsl *.nuspec | tee feeds.xml
#for nuspec in ./*.nuspec; do
#  f="${nuspec##*/}"
#  id="${f%.*}"
#  echo $id
#done
rm -f ./*.nuspec
sed -i feeds.xml -e '/^<\/feed>/,/^<feed[^>]*>/d' Packages
