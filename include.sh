#!/bin/bash

set -e

for p in "$@"; do
    if [ `pwd` != "$HOME" ]; then
        if [ -f "$p" ]; then
            mv -v "$p" $HOME
        fi
    fi
done

cd ~

for p in "$@"; do
    if [ -f "$p" ]; then
        reprepro -b /var/www/deb.amusewiki.org/repos/apt/debian includedeb bookworm $p
        reprepro -b /var/www/deb.amusewiki.org/repos/apt/debian includedeb trixie $p
        mkdir -p uploaded
        mv $p uploaded
    else
        echo "$p does not exist!"
    fi
done

reprepro -b /var/www/deb.amusewiki.org/repos/apt/debian checkpool

cat <<EOF > /var/www/deb.amusewiki.org/repos/apt/index.html
<!doctype html>
<html>
  <head>
    <title>Amusewiki Debian Packages</title>
  </head>
  <body>
    <h1>How to install <a href="https://amusewiki.org">amusewiki</a> in 4 commands (on Debian Bookworm/Trixie/Ubuntu)</h1>

<p>Please note that the .deb packages provided here are fully compatible for Debian and Ubuntu, and the instructions are the same
even if the source list will say <code>debian</code>.</p>

<p>Existing packages for older Debian and Ubuntu releases are still
provided at <a href="https://packages.amusewiki.org">https://packages.amusewiki.org</a>,
but support for them has stopped with Amusewiki release 2.611 (December 2025).
You can still run Amusewiki on such systems
using the <a href="https://amusewiki.org/library/install">manual
installation</a>.</p>

<p>Supported database are mysql/mariadb, postgresql and sqlite3.
Please install <code>postgresql</code> or
<code>mariadb-server</code> <strong>before starting the installation</strong>. You will
be prompted to choose which one to use, but use <code>postgresql</code> if you can choose.</p>

<p>
Amusewiki uses nginx as frontend server, so <strong>if you have Apache
running, you need to change your setup (and free the HTTP and HTTPS
ports) before starting the installation.</strong>
See for example <a href="http://kbeezie.com/apache-with-nginx/">this 
article</a> for a combined setup Apache/Nginx.
</p>

<h2>Add the keyring and the APT source list</h2>

For Trixie:

<pre>
# wget https://deb.amusewiki.org/amusewiki-archive-keyring-trixie_1.0.0_all.deb
# dpkg -i amusewiki-archive-keyring-trixie_1.0.0_all.deb
</pre>

For Bookworm:

<pre>
# wget https://deb.amusewiki.org/amusewiki-archive-keyring-bookworm_1.0.0_all.deb
# dpkg -i amusewiki-archive-keyring-bookworm_1.0.0_all.deb
</pre>

Then run:
<pre>
# apt-get update      
# apt-get install --no-install-recommends amusewiki
</pre>

<p>
The output is going to prompt you to change the nginx configuration and give you the credentials for the login and a hostname to use.
</p>

<p>
The virtual host used by nginx is roughly a blind guess, so probably
you will need to <strong>put the ip/hostname association in the
<code>/etc/hosts</code> file on the client machine</strong> (i.e.
yours, not the server) to access the server for the initial
configuration.
</p>

<p>This is the point where people get stuck. Amusewiki is multisite,
so it is not going to respond unless you request the correct hostname.
The initial configuration assigned a guessed hostname (say,
<code>amusewiki.yournetwork.org</code>) and you need to use that to
access the dashboard, hence the <code>/etc/hosts</code> trick. Once
you reach the dashboard you can update them it to the correct one.
</p>

<p>The initial site with documentation is created to give you a way to
reach the admin panel, where you should create a brand new site from
<code>/admin/sites</code> and possibly make inactive the default
one.</p>

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
      <h2>Trixie</h2>
      <pre>
EOF

reprepro -b /var/www/deb.amusewiki.org/repos/apt/debian list trixie | sed -e 's/^.*: //' | sort | uniq >> /var/www/deb.amusewiki.org/repos/apt/index.html

cat <<EOF>>/var/www/deb.amusewiki.org/repos/apt/index.html
      </pre>
    </div>

    <div>
      <h2>Bookworm</h2>
      <pre>
EOF

reprepro -b /var/www/deb.amusewiki.org/repos/apt/debian list bookworm | sed -e 's/^.*: //' | sort | uniq >> /var/www/deb.amusewiki.org/repos/apt/index.html


cat <<EOF >> /var/www/deb.amusewiki.org/repos/apt/index.html
      </pre>
    </div>
    <h1>Contact and bug reports</h1>
    <p>Marco Pessotto <code>melmothx -at- gmail -dot- com</code></p>
    <p><a href="https://github.com/melmothx/amusewiki/issues">Github bug tracker</a></p>
  </body>
</html>
EOF
