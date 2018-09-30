#!/bin/bash

arch=x86_64
mirror=http://mirror.rit.edu/archlinux
libnames=(openssl libarchive 
pacman)

#Find actual lib versions at 
https://www.archlinux.org/packages/ 
and replace them
libs=(openssl-1.1.1-1 
libarchive-3.3.3-1 
pacman-5.1.1-1)

# link to cache (or download) 
and extract: 
openssl,libarchive,pacman
cd {$HOME}
for pkg in "${libs[@]}"
do
    
pkgname=${pkg}-${arch}.pkg.tar.xz
    if [[ -e 
/var/cache/pacman/pkg/${pkgname} 
]]
    then
        ln -sf 
/var/cache/pacman/pkg/${pkgname} 
.
        echo "$pkgname from 
cache";
    else
        wget 
${mirror}/core/os/${arch}/${pkgname} 
|| exit 1
        echo "$pkgname 
downloaded";
    fi
    echo 'try extract';
    sudo tar -xJvpf ${pkgname} 
--directory / --exclude 
.PKGINFO --exclude .INSTALL || 
exit 1
    rm ${pkgname}
done

# now reinstall using pacman to 
update the local pacman db
sudo pacman -S --force 
${libnames[@]} || exit 1

# now update your system
sudo pacman -Syu
