#!/bin/bash

set -e

if [ `pwd` != "$HOME" ]; then
    if [ -f "$1" ]; then
        mv "$1" $HOME
    fi
fi

cd ~

if [ -f "$1" ]; then
    # reprepro -b /var/www/packages.amusewiki.org/repos/apt/debian includedeb jessie $1
    reprepro -b /var/www/packages.amusewiki.org/repos/apt/debian includedeb stretch $1
    reprepro -b /var/www/packages.amusewiki.org/repos/apt/debian includedeb buster $1
    mkdir -p uploaded
    mv $1 uploaded
fi

rm -rf amusewiki-packages
mkdir amusewiki-packages
reprepro -b /var/www/packages.amusewiki.org/repos/apt/debian checkpool
find /var/www/packages.amusewiki.org/repos/apt/debian -iname "*.deb" -exec cp {} amusewiki-packages \;
tar -czvf amusewiki-debian-packages.tar.gz amusewiki-packages
gpg2 --detach-sign amusewiki-debian-packages.tar.gz
mv amusewiki-debian-packages.tar.gz /var/www/packages.amusewiki.org/repos/apt/
mv amusewiki-debian-packages.tar.gz.sig /var/www/packages.amusewiki.org/repos/apt/


cat <<EOF > /var/www/packages.amusewiki.org/repos/apt/index.html
<!doctype html>
<html>
  <head>
    <title>Amusewiki debian packages</title>
  </head>
  <body>
    <h1>How to install <a href="https://amusewiki.org">amusewiki</a> in 4 commands (on Debian Stretch/Buster and Ubuntu 18.04 LTS)</h1>

<p>Please note that the .deb packages provided here are fully compatible for Debian and Ubuntu, and the instructions are the same
even if the source list will say <code>debian</code>.</p>

<p>Existing packages for Jessie and Ubuntu 16.04 (see below) are
still provided, but the support for them has stopped with Amusewiki
release 2.390. You can still run Amusewiki on such systems using the
<a href="https://amusewiki.org/library/install">manual
installation</a>.</p>

<p>Supported database are mysql, postgresql and sqlite3. 
Please install <code>postgresql</code> or
<code>mysql-server</code> <strong>before starting the installation</strong>. You will
be prompted to choose which one to use.</p>

<p>
Amusewiki uses nginx as frontend server, so <strong>if you have Apache
running, you need to change your setup (and free the HTTP and HTTPS
ports) before starting the installation.</strong>
See for example <a href="http://kbeezie.com/apache-with-nginx/">this 
article</a> for a combined setup Apache/Nginx.
</p>


    <h2>Add the key</h2>
    <pre>
# wget -O - https://packages.amusewiki.org/amusewiki.gpg.key | apt-key add -
    </pre>
    <h2>Add a source list entry</h2>
    <p>Please use <code>buster</code> (for Debian Buster) instead of <code>stretch</code> (Debian Stretch and Ubuntu 18.04) depending on your distribution. See below for the details.</p>
    <pre>
# echo 'deb http://packages.amusewiki.org/debian stretch main' &gt; /etc/apt/sources.list.d/amusewiki.list
    </pre>
    <h2>Install amusewiki</h2>
    <pre>
# apt-get update      
# apt-get install amusewiki-extra-fonts # this is optional
# apt-get install --no-install-recommends amusewiki
    </pre>
<p>
The output is going to prompt you to change the nginx configuration and give you the credentials for the login.
</p>

<p>
The virtual host used by nginx is roughly a blind guess, so probably
you will need to <strong>put the hostname on /etc/hosts</strong> to access it for the
initial configuration.
</p>

<p>

The installation procedure will send a mail to
<code>root@localhost</code> with the credentails to login in and the
nginx configuration instructions. If for some reason you didn't get
it, you can look at <code>/var/log/amusewiki/installation.log</code>
(since version 2.310). 
</p>



    <h1>List of packages provided by this repository</h1>
    <p>
      <a href="/debian/pool">You can browse them here</a>
    </p>
    <div>
      <h2>Jessie (and Ubuntu 16.04 LTS). [ARCHIVED]</h2>
    <pre>
# echo 'deb http://packages.amusewiki.org/debian jessie main' &gt; /etc/apt/sources.list.d/amusewiki.list
    </pre>

      <pre>
EOF

reprepro -b /var/www/packages.amusewiki.org/repos/apt/debian list jessie | sed -e 's/^.*: //' | sort | uniq >> /var/www/packages.amusewiki.org/repos/apt/index.html

cat <<EOF>>/var/www/packages.amusewiki.org/repos/apt/index.html
      </pre>
    </div>
    <div>
      <h2>Stretch (and Ubuntu 18.04 LTS)</h2>
    <pre>
# echo 'deb http://packages.amusewiki.org/debian stretch main' &gt; /etc/apt/sources.list.d/amusewiki.list
    </pre>

      <pre>
EOF

reprepro -b /var/www/packages.amusewiki.org/repos/apt/debian list stretch | sed -e 's/^.*: //' | sort | uniq >> /var/www/packages.amusewiki.org/repos/apt/index.html

cat <<EOF>>/var/www/packages.amusewiki.org/repos/apt/index.html
      </pre>
    </div>
    <div>
      <h2>Buster</h2>
    <pre>
# echo 'deb http://packages.amusewiki.org/debian buster main' &gt; /etc/apt/sources.list.d/amusewiki.list
    </pre>

      <pre>
EOF

reprepro -b /var/www/packages.amusewiki.org/repos/apt/debian list buster | sed -e 's/^.*: //' | sort | uniq >> /var/www/packages.amusewiki.org/repos/apt/index.html

cat <<EOF >> /var/www/packages.amusewiki.org/repos/apt/index.html
      </pre>
    </div>
    <div><a href="amusewiki-debian-packages.tar.gz">Get all the package here if you want to install them without apt.<a> <a href="amusewiki-debian-packages.tar.gz.sig">Signature.</a> <a href="https://github.com/melmothx/amusewiki-debian-packages">Sources</a></div>
    <h1>Contact and bug reports</h1>
    <p>Marco Pessotto <code>melmothx -at- gmail -dot- com</code></p>
    <p><a href="https://github.com/melmothx/amusewiki/issues">Github bug tracker</a></p>
  </body>
</html>
EOF
