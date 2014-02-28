Video modes
===========

Tibidabo has three possible video outputs:

* HDMI via connector *CN8*

* LVDS via connector *CN3*, thought for SAMSUNG's MODEL LTI460HN08 (connector pad numeration is reversed with respect to SAMSUNG monitor datasheet to direct use of a flat ribbon lvds cable)

* LVDS via display port connector *CN22*, meant for SILICA lvds display

.. warning::

    Do not connect CN22 to DISPLAY PORT devices, CN22 uses just the connector of a DISPLAY PORT but the signals are meant to work just with Silica's LCD (LVDS) displays.

If you want to boot using SILICA's lcd as the only video output device you need to add to the kernel command line something like:

::

    video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666 ldb=dul0

If you want to boot using SAMSUNG's display as the only video output device you need to add to the kernel command line something like:

::

    video=mxcfb0:dev=ldb,LDB-1080P60,if=RGB666 ldb=spl0

If you want to boot using a full HD HDMI display as the only video output device you need to add to the kernel command line something like:

::

    video=mxcfb0:dev=hdmi,1920x1080M@60,if=RGB24

You can have a video output on more than one device and the resolutions stated before are not the only resolutions available.
Keep also into account that the LVDS output has several working modes, like: *spl, dul, sin, sep* (please, have a look at */drivers/video/mxc/ldb.c*).
