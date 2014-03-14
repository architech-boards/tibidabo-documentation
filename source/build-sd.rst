Create SD image to bootup
=========================

You can copy in a SD card the image built.
By default, Tibidabo's Yocto/OpenEmbedded SDK will generate an .sdcard image.
File *.sdcard* can be written out "as is" on the final medium with, for example, *dd* program:

::

    sudo dd if=/path/to/image.sdcard of=/your/sd/card/device

.. important::

    Be very careful when you use *dd* to write to a device to pick up the right device, otherwise you can mess up another disk you have on your machine, destroying its content forever!

