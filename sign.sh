wget http://blackarch.org/blackarch/blackarch/os/x86_64/blackarch-keyring-20140118-3-any.pkg.tar.xz{,.sig}
gpg --keyserver hkp://pgp.mit.edu --recv-keys '4345771566D76038C7FEB43863EC0ADBEA87E4E3'
gpg --with-fingerprint --verify blackarch-keyring-20140118-3-any.pkg.tar.xz.sig
rm blackarch-keyring-20140118-3-any.pkg.tar.xz.sig
pacman-key --init
pacman -U blackarch-keyring-20140118-3-any.pkg.tar.xz
