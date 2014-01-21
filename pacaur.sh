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
