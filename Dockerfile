FROM base/arch
MAINTAINER elken

RUN pacman -Syu --noconfirm --ignore=filesystem && \
    pacman -Su --noconfirm --dbonly filesystem && \
    /usr/bin/ln -s /usr/bin /bin && \
    /usr/bin/ln -s /usr/sbin /sbin && \
    pacman -Scc --noconfirm

CMD curl https://aur.archlinux.org/packages/co/cower/cower.tar.gz | tar -zx
CMD pushd cower
CMD makepkg -s PKGBUILD --install `if [ $(id -u) = 0 ]; then echo "--asroot" ; fi`
CMD popd
CMD rm -rf cower
CMD curl https://aur.archlinux.org/packages/pa/pacaur/pacaur.tar.gz | tar -zx
CMD pushd pacaur
CMD makepkg -s PKGBUILD --install `if [ $(id -u) = 0 ]; then echo "--asroot" ; fi`
CMD popd
CMD rm -rf pacaur

RUN pacman -S afflib aircrack-ng arch-install-scripts autoconf avr-libc bash bluez bluez-libs bluez-utils\
boost boost-libs c-ares cmake cuda curl devtools dietlibc distcc dmenu gcc gcc-libs gdbm glib2\
glibc gmp gnuradio gnutls gpsd graphviz gtk2 gtksourceview2 haskell-openafp haskell-regex-compat impacket\
iptables java-environment jre7-openjdk-headless lib32-glibc libcap-ng libdaq-static libdnet libevent\
libextractor libglade libgnome libgnomeui libjpeg libnet libnfc libnl libowfat libpcap libpcap\
libpcap libpcap libpng libssh libssh2 libusbx libusbx libx11 libx11 rdesktop libxslt\
linux linux make mariadb mdk3 metasploit mono ncurses nmap node-ar-drone nodejs openbox openssl\
orbited pcre perl perl-bit-vector perl-class-gomor perl-class-load perl-class-load\
perl-class-loader perl-convert-pem perl-crypt-des perl-file-which perl-io-socket-ssl\
perl-io-tty perl-libwww perl-net-dns perl-net-snmp perl-switch perl-tk perl-try-tiny\
perl-xml-libxml perl-xml-twig phonon-backend php postgresql-libs ppp pygtk python2\
python2-dnspython python2-gobject2 python2-numpy python2-paramiko\
python2-pycurl python2-pyopenssl python3 python bluez-libs python-django python-ipcalc python-xbee\
qt4 qt4 qt5-base readline ruby ruby1.8 ruby1.9 ruby-activemodel=4.0.1\
ruby-activerecord ruby-addressable ruby-diff-lcs ruby-domain_name\
ruby-ethon ruby-ffi ruby-gscraper ruby-json ruby-libv8\
ruby-mini_portile ruby-nokogiri ruby-rspec-core ruby-safe_yaml\
ruby-simplecov-html ruby-unf samba screen sqlite3 sslscan talloc tcpdump tidyhtml\
tor tre twisted unixodbc util-linux vala wine wxgtk zlib zsh

CMD echo [blackarch]\nServer\ =\ http://blackarch.pi3rrot.net/blackarch/$repo/os/$arch

