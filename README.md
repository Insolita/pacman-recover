# Recover broken pacman

### When i should use it?
I wrote it fo fix error "version `OPENSSL_1_1_1' not found", but may be it help with other problems

### How it works?

It download from aur libraries openssl, libarchive and pacman and replace local libraries with new, after that it try make normal sync and upgrade

### Usage

clone repository to your favorite folder, or copy-paste pacman-recover.sh from this repo :-)

open pacman-recover.sh in your favorite editor and ensure that versions of libs - openssl, libarchive, and pacman are actual.
Replace with newer versions if need;

add execution permissions to script `# chmod +x pacman-recover.sh`

run it

`# ./pacman-recover.sh`
