# Apache NuGet Repository Hosting

These scripts and xsl transforms, enable hosting of a simple NuGet repository under Apache (on Linux).

## Installation (on Fedora)

- If you don't already have Apache:

        # install apache
        sudo dnf install -y httpd
        # start apache
        sudo service httpd start
        # make apache start on system boot
        sudo chkconfig httpd on

- If you don't already have incron:

        # install incron
        sudo dnf install -y incron
        # start incron
        sudo service incrond start
        # make incron start on system boot
        sudo chkconfig incrond on

- Create your repository:

        sudo mkdir -p /data/repos && sudo chown -R $(whoami):$(whoami) /data
        # clone this tool as your repository root
        git clone https://github.com/grenade/apache-nuget-repo.git /data/repos/nuget
        # create your packages folder
        mkdir /data/repos/nuget/nupkg
        # make generate-manifest executable
        chmod u+x generate-manifest.sh

- Configure Apache to host your NuGet repo:

        # if running `getenforce` returns 'Enforcing',
        # run the following command to tell selinux to allow serving up the /data directory
        sudo chcon -R -t httpd_sys_content_t /data
        # modify /data/repos/nuget/misc/data.conf to your liking, then:
        sudo cp /data/repos/nuget/misc/data.conf /etc/httpd/conf.d/
        sudo ln -s /data/repos /var/www/html/
        service httpd restart

- Configure incron to regenerate the manifest when changes are detected

        # create an incron user table for your user account:
        sudo cp misc/incron-nuget-repo.conf /var/spool/incron/$(whoami)
        sudo chown root:$(whoami) /var/spool/incron/$(whoami)
        sudo chmod 600 /var/spool/incron/$(whoami)
        # grant permission to run incron jobs to your user account:
        echo $(whoami)> incron.allow
        sudo mv incron.allow /etc/
        sudo service incrond restart

- Populate your repo and manifest:

        cd /data/repos/nuget
        # download some packages
        # (optional, but useful for testing, otherwise put your own packages in the nupkg folder)
        chmod u+x /data/repos/nuget/misc/download-some-packages.sh
        ./misc/download-some-packages.sh        

## Usage

generate-manifest.sh should run (under incron) whenever a package is added or removed from the packages folder. After running the installation instructions above, you should be able to browse packages at http://localhost/repos/nuget/html/

## Explanation

The generate-manifest script does the following things (in pretty much the order listed):

- locks execution so that only a single instance of the script can run at a given moment
- changes the current working directory to the folder containing the script
- extracts the .nuspec file from the .nupkg files
- moves the extracted .nuspec file from *repo_root*/*pkg_id*.nuspec to *repo_root*/nuspec/*pkg_id*.*pkg_ver*.nuspec
- performs an XSL transform on each .nuspec file to generate an html description of the package at *repo_root*/html/*pkg_id*.*pkg_ver*.html
- creates an array of distinct package ids (package name without the version)
- performs an XSL transform on all .nuspec files to generate an xml manifest of all packages at: *repo_root*/Packages (file without extension, NuGet convention)
- creates a *repo_root*/.htaccess file, containing 302 redirects from *repo_root*/package/*pkg_id* to the latest version of the package at *repo_root*/nupkg/*pkg_id*.*pkg_ver*.nupkg (NuGet convention for package downloads)
- copies the .nuspec file for the latest version of each package to *repo_root*/latest/
- performs an xsl transform on all latest version .nuspec files to generate an html index of all latest versions of packages at *repo_root*/html/index.html
