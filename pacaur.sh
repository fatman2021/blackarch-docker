curl https://aur.archlinux.org/packages/co/cower/cower.tar.gz | tar -zxf -
cd cower
makepkg -s PKGBUILD --install --noconfirm `if [ $(id -u) = 0 ]; then echo "--asroot" ; fi`
cd ..
rm -rf cower
curl https://aur.archlinux.org/packages/pa/pacaur/pacaur.tar.gz | tar -zxf -
cd pacaur
makepkg -s PKGBUILD --install --noconfirm `if [ $(id -u) = 0 ]; then echo "--asroot" ; fi`
cd ..
rm -rf pacaur
