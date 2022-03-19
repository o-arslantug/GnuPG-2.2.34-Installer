# GnuPG-2.2.34 Installer for Ubuntu

In some cases the gpgs which were created by GnuPG-2.3.4 cannot be decrypted on Ubuntu which uses GnuPG-2.2.19.

It is necessary for people especially who using password-store on WSL2.

Run the line which is below before run the scipt;
```
export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
```