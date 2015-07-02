#!/bin/bash

#for pkg in nxlog git.install; do
#  echo $pkg
#  curl -L http://chocolatey.org/api/v2/package/$pkg -o $pkg.nupkg
#done

unzip "*.nupkg" "*.nuspec"
xsltproc transform.xsl *.nuspec | tee Packages
#for nuspec in ./*.nuspec; do
#  f="${nuspec##*/}"
#  id="${f%.*}"
#  echo $id
#done
rm -f ./*.nuspec