# Apache NuGet Repository Hosting

These scripts and xsl transforms, enable hosting of a simple NuGet repository under Apache (on Linux).

## Usage

Run `generate-manifest.sh` from the NuGet repository root (the parent folder of 'nupkg' where nupkg contains *.nupkg files), maybe: '/data/repos/nuget'.

The script does the following things (in pretty much the order listed):

- extracts the .nuspec file from the .nupkg files
- moves the extracted .nuspec file from <repo_root>/<pkg_id>.nuspec to <repo_root>/nuspec/<pkg_id>.<pkg_ver>.nuspec
- performs an XSL transform on each .nuspec file to generate an html description of the package at <repo_root>/html/<pkg_id>.<pkg_ver>.html
- creates an array of distinct package ids (package name without the version)
- performs an XSL transform on all .nuspec files to generate an xml manifest of all packages at: <repo_root>/Packages (file without extension, NuGet convention)
- creates a <repo_root>/.htaccess file, containing 302 redirects from <repo_root>/package/<pkg_id> to the latest version of the package at <repo_root>/nupkg/<pkg_id>.<pkg_ver>.nupkg (NuGet convention for package downloads)
- copies the .nuspec file for the latest version of each package to <repo_root>/latest/
- performs an xsl transform on all latest version .nuspec files to generate an html index of all latest versions of packages at <repo_root>/html/index.html
