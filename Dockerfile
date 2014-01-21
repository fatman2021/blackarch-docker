FROM base/arch
MAINTAINER elken

RUN pacman -Syu --noconfirm --ignore=filesystem && \
    pacman -Su --noconfirm --dbonly filesystem && \
    /usr/bin/ln -s /usr/bin /bin && \
    /usr/bin/ln -s /usr/sbin /sbin && \
    pacman -Scc --noconfirm

CMD if ! command -v pacaur ; then
        curl https://aur.archlinux.org/packages/co/cower/cower.tar.gz | tar -zx
        pushd cower
        makepkg -s PKGBUILD --install `if [ $(id -u) = 0 ]; then echo "--asroot" ; fi`
        popd
        rm -rf cower
    
        curl https://aur.archlinux.org/packages/pa/pacaur/pacaur.tar.gz | tar -zx
        pushd pacaur
        makepkg -s PKGBUILD --install `if [ $(id -u) = 0 ]; then echo "--asroot" ; fi`
        popd
        rm -rf pacaur
    fi

RUN pacman -S afflib aircrack-ng arch-install-scripts autoconf avr-libc bash bluez bluez-libs bluez-utils\
boost boost-libs c-ares cmake cuda curl devtools dietlibc distcc dmenu gcc gcc-libs gdbm glib2\
glibc gmp gnuradio gnutls gpsd graphviz gtk2 gtksourceview2 haskell-openafp haskell-regex-compat impacket\
iptables java-environment jre7-openjdk-headless lib32-glibc libcap-ng libdaq-static libdnet libevent\
libextractor libglade libgnome libgnomeui libjpeg libnet libnfc>=1.4.0 libnl libowfat libpcap libpcap>=1.0.0\
libpcap>=1.3.0 libpcap>=1.4.0 libpng libssh libssh2 libusbx libusbx>=1.0.12 libx11 libx11 rdesktop libxslt\
linux linux>=3.0.0 make mariadb mdk3 metasploit mono ncurses nmap node-ar-drone nodejs openbox openssl\
orbited pcre perl perl>=0 perl>=5.004 perl>=5.006 perl>=5.10.0 perl>=5.10.1 perl>=5.14.0 perl>=5.16.2\
perl>=5.5.0 perl>=5.8.1 perl-bit-vector>=0 perl-class-gomor perl-class-load perl-class-load>=0.09\
perl-class-loader>=2.00 perl-convert-pem>=0.05 perl-crypt-des perl-file-which perl-io-socket-ssl\
perl-io-tty>=1.03 perl-libwww perl-net-dns perl-net-snmp perl-switch perl-tk perl-try-tiny\
perl-xml-libxml perl-xml-twig>=3.16 phonon-backend php postgresql-libs ppp pygtk python python2 python2>=2.4\
python2>=2.5 python2>=2.7 python>=2.4 python2-dnspython python2-gobject2 python2-numpy python2-paramiko\
python2-pycurl python2-pyopenssl python3 python bluez-libs python-django python-ipcalc python-xbee\
qt4 qt4>=4.5 qt4>=4.6 qt4>=4.7.0 qt5-base readline ruby ruby1.8 ruby1.9 ruby-activemodel=4.0.1\
ruby-activerecord>=3.2.13 ruby-addressable>=2.2.7 ruby-diff-lcs>=1.1.3 ruby-domain_name>=0.5\
ruby-ethon>=0.6.2 ruby-ffi>=1.3.0 ruby-gscraper>=0.4 ruby-json>=1.6 ruby-libv8>=3.11.8.12\
ruby-mini_portile>=0.5.0 ruby-nokogiri>=1.3 ruby-rspec-core>=2.14.0 ruby-safe_yaml>=0.9.0\
ruby-simplecov-html>=0.8.0 ruby-unf<1.0.0 samba screen sqlite3 sslscan talloc tcpdump tidyhtml\
tor tre twisted unixodbc util-linux vala wine wxgtk zlib zsh

CMD echo [blackarch]\nServer\ =\ http://blackarch.pi3rrot.net/blackarch/$repo/os/$arch

