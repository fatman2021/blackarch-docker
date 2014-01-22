FROM base/devel:minimal
MAINTAINER elken

# Ensure max level
RUN pacman -Syyu --needed --noconfirm

# Install pacaur
ADD ./pacaur.sh /pacaur.sh
RUN /pacaur.sh

# Space-saving strats
RUN pacman -Scc --noconfirm

# Add repo
CMD echo "[blackarch]\nServer\ =\ http://blackarch.pi3rrot.net/blackarch/$repo/os/$arch" > /etc/pacman.conf

# Main install
RUN pacman -Syy --needed -noconfirm blackarch

# Dem deps
#RUN pacaur -S --needed --noconfirm --noedit --devel aircrack-ng arch-install-scripts autoconf avr-libc bash bluez bluez-libs bluez-utils \
# boost boost-libs c-ares cmake curl devtools dietlibc distcc dmenu gcc gcc-libs gdbm glib2 \
# glibc gmp gnuradio gnutls gpsd graphviz gtk2 gtksourceview2 haskell-openafp haskell-regex-compat impacket \
# iptables java-environment jre7-openjdk-headless libcap-ng libdnet libevent \
# libextractor libglade libgnome libgnomeui libjpeg libnet libnfc libnl libpcap \
# libpng libssh libssh2 libusbx libx11 rdesktop libxslt \
# linux make mariadb metasploit mono ncurses nmap nodejs openbox openssl \
# orbited pcre perl perl-bit-vector perl-class-gomor perl-class-load \
# perl-convert-pem perl-crypt-des perl-file-which perl-io-socket-ssl \
# perl-io-tty perl-libwww perl-net-dns perl-net-snmp perl-switch perl-tk perl-try-tiny \
# perl-xml-libxml perl-xml-twig phonon-backend php postgresql-libs ppp pygtk python2 \
# python2-dnspython python2-gobject2 python2-numpy python2-paramiko \
# python2-pycurl python2-pyopenssl python3 python-django python-ipcalc python-xbee \
# qt4 qt5-base readline ruby ruby1.8 ruby1.9  \
# ruby-activerecord ruby-addressable ruby-diff-lcs ruby-domain_name \
# ruby-ethon ruby-ffi ruby-gscraper ruby-json ruby-libv8 \
# ruby-mini_portile ruby-nokogiri ruby-rspec-core ruby-safe_yaml \
# ruby-simplecov-html ruby-unf samba screen sqlite3 sslscan talloc tcpdump tidyhtml \
# tor tre twisted unixodbc util-linux vala  wxgtk zlib zsh



