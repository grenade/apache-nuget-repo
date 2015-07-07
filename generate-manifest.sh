#!/bin/bash

# https://gist.github.com/grenade/b4f11aa5080f9f5209f4

inArray () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

packages=()
for path in packages/*.nupkg; do
  file=${path##*/}
  package=${file%.nupkg}
  package_id=$(echo "$package" | sed 's/\.[0-9].*//')
  package_version=$(echo "$package" | sed "s/^$package_id\.//")
  unzip $path "*.nuspec"
  mv "$package_id.nuspec" "nuspec/$package_id.$package_version.nuspec"
  if ! inArray $package_id "${packages[@]}" ; then
    packages+=($package_id)
  fi
done
xsltproc transform.xsl nuspec/*.nuspec | sed -e '/^<\/feed>/,/^<feed[^>]*>/d' > packages.xml

echo > .htaccess
for package_id in "${packages[@]}"; do
  latest=$(ls packages/$package_id.*.nupkg | sort --version-sort -r | head -1)
  echo RedirectMatch 302 ^package/$package_id/?$ packages/$latest >> .htaccess
done
