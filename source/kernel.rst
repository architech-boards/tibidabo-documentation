Linux Kernel
============

Like we saw for the :ref:`bootloader <bsp_bootloader_label>`, the first thing you need is: sources.
Get them from *Bitbake* build directory (if you built the kernel with it) or get them from the Internet.

*Bitbake* will place the sources under directory:

::

    /path/to/build/tmp/work/tibidabo-poky-linux-gnueabi/linux-imx/3.0.35-r38.14/git


If you are working with the virtual machine, you will find them under directory:

::

    /home/architech/architech_sdk/architech/tibidabo/yocto/build/tmp/work/tibidabo-poky-linux-gnueabi/linux-imx/3.0.35-r38.14/git


We suggest you to **don't work under Bitbake build directory**, you will pay a speed penalty and you can have troubles syncronizing
the all thing. Just copy them some place else and do what you have to do.

If you didn't build them already with *Bitbake* or you just want to do make every step by hand, you can always get them from the Internet
by cloning the proper repository and checking out the proper hash commit:

::

    git clone git://git.freescale.com/imx/linux-2.6-imx.git
    cd linux-2.6-imx
    git checkout bdde708ebfde4a8c1d3829578d3f6481a343533a 

and by properly patching the sources:

::

    git clone -b dora https://github.com/architech-boards/meta-tibidabo.git
    patch -p1 -d /path/to/linux-2.6-imx < meta-tibidabo/recipes-kernel/linux/linux-imx-3.0.35/0001-tibidabo.patch
    cp meta-tibidabo/recipes-kernel/linux/linux-imx-3.0.35/defconfig /path/to/linux-2.6-imx/.config

Now that you have the sources, you can start browsing the code from the following files:

::

    arch/arm/mach-mx6/board-tibidabo.c
    drivers/mtd/devices/n25q.c

Get the toolchain like described :ref:`here <bsp_bootloader_label>`, source the script to load the proper evironment and you are ready
to customize the kernel:

::

    cd /path/to/linux-2.6-imx
    make menuconfig

and to compile it:

::

    make -j <2 * number of processor's cores> uImage

By the end of the build process you will get **uImage** under *arch/arm/boot*.

Enjoy!
