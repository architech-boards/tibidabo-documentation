.. _bsp_bootloader_label:

U-boot
======

The bootloader used by Tibidabo is **u-boot**. 
If you want to browse/modify the sources first you have to get them. There are two viable ways to do that:

* if you already built Tibidabo's bootloader with *Bitbake* then you already have them on your (virtual) disk, otherwise

* you can download and patch them.

*Bitbake* will place *u-boot* sources under:

::

    /path/to/build/tmp/work/tibidabo-poky-linux-gnueabi/u-boot-fslc/v2013.10-r1/git

this means that within the virtual machine you will find them under:

::

    /home/architech/architech_sdk/architech/tibidabo/yocto/build/tmp/work/tibidabo-poky-linux-gnueabi/u-boot-fslc/v2013.10-r1/git



We suggest you to **don't work under Bitbake build directory**, you will pay a speed penalty and you can have troubles syncronizing
the all thing. Just copy them some place else and do what you have to do.

If you didn't build them already with *Bitbake* or you just want to do make every step by hand, you can always get them from the Internet
by cloning the proper repository and checking out the proper hash commit:

::

    git clone git://github.com/Freescale/u-boot-imx.git
    cd u-boot-imx
    git checkout 079e214888279518ce061c71238a74a0c3db2c28

and by properly patching the sources:

::

    git clone -b dora https://github.com/architech-boards/meta-tibidabo.git
    patch -p1 -d /path/to/u-boot-imx < meta-tibidabo/recipes-bsp/u-boot/u-boot-fslc-v2013.10/0001-tibidabo.patch

Now that you have the sources, you can start browsing the code from the following files:

::

    board/architech/tibidabo/*
    include/configs/tibidabo.h

Suppose you modified something and you want to recompile the sources to test your patches, well, you need a cross-toolchain.
If you are not working with the virtual machine, the most comfortable way to get the toolchain is to ask *Bitbake* for it:

::

    bitbake meta-toolchain

When *Bitbake* finishes, you will find an install script under directory:

::

    path/to/build/tmp/deploy/sdk/

Install the script, and you will get under the installation directory a script to source to get your environment almost in place
for compiling. The name of the script is:

::

    environment-setup-cortexa9hf-vfp-neon-poky-linux-gnueabi

Anyway, the environment is not quite right for compiling the bootloader and the Linux kernel, you need to unset a few variables:

::

    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS

Ok, now you a working environment to compile *u-boot*, just do:

::

    cd /path/to/sources/directory
    make distclean
    make mrproper
    make tibidabo_config
    make [-j parallelism factor] all

if you omit *-j* parameter, *make* will run one task after the other, if you specify it *make* will parallelize the tasks execution 
while respecting the dependencies between them.
Generally, you will place a value for *-j* parameter corresponding to the double of your processor's cores number, for example, on a
quad core machine you will place *-j 8*.

Under the virtual machine, the toolchain is already installed under:

::

    /home/architech/architech_sdk/architech/tibidabo/toolchain

In the very same directory there is a file, **environment-nofs**, that you can source that takes care of the environment for you when
you want to compile the bootloader or the kernel.

Once the build process is complete, you will find **u-boot.imx** file in your sources directory, that's the file you need to boot the board.

Enjoy!
