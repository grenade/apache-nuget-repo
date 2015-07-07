#!/bin/bash

inArray () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}
packages=()
mkdir nuspec
for path in nupkg/*.nupkg; do
  file=${path##*/}
  package=${file%.nupkg}
  package_id=$(echo "$package" | sed 's/\.[0-9].*//')
  package_version=$(echo "$package" | sed "s/^$package_id\.//")
  unzip $path "*.nuspec"
  mv "$package_id.nuspec" "nuspec/$package_id.$package_version.nuspec"
  if ! inArray $package_id "${packages[@]}"; then
    packages+=($package_id)
  fi
done
xsltproc transform.xsl nuspec/*.nuspec | sed ':a;N;$!ba;s/<\/feed>\n<feed[^>]*>\n//g' > Packages
rm -rf nuspec
echo > .htaccess
for package_id in "${packages[@]}"; do
  latest=$(ls nupkg/$package_id.*.nupkg | sort --version-sort -r | head -1)
  echo RedirectMatch 302 ^package/$package_id/?$ $latest >> .htaccess
done
