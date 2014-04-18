Root FS
=======

By default, Tibidabo's Yocto/OpenEmbedded SDK will generate three different types of files when you build an image:

* *.ext3*,

* *.tar.bz2*, and

* *.sdcard*.

*.ext3* is meant to be used by *QEMU* and won't be discussed here. The *.tar.bz2* file can be flattened out in your final
medium partition (on SD card, flash memory, mSATA disk or USB stick) or on your host development system and used for build
purposes with the Yocto Project.
File *.sdcard* can be written out "as is" on the final medium with, for example, *dd* program:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'rootfs_rst-host-151' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="rootfs_rst-host-151" class="language-markup">sudo dd if=/path/to/image.sdcard of=/path/to/your/final/media/device</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Where, the path to the image *.sdcard* file inside the SDK virtual machine is:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'rootfs_rst-host-152' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="rootfs_rst-host-152" class="language-markup">/home/architech/architech_sdk/architech/tibidabo/yocto/build/tmp/deploy/images/tibidabo</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

.. warning::

 Be very careful when you use *dd* to write to a device to pick up the right device, otherwise you can mess up another disk you have on your machine, destroying its content forever!

.. warning::
 
 The content of the media will be lost forever!

.. important::

 Be sure you **unmount the device** from the filesystem before using **dd** program, you sure don't want to have the operating system interfere during the write process.

After *dd* completes, run:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'rootfs_rst-host-153' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="rootfs_rst-host-153" class="language-markup">sync</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Generally, especially at the beginning, when you build an image for Tibidabo is more comfortable to create an SD card using
the *.sdcard* file, because you need almost zero effort to get everything running. However, if you need to develop for a while
on the board this solution turns out to be inefficient, and you will want a faster solution. Assuming you already built an
SD card out of a *.sdcard* file, you have an SD card with two partitions on it. The first one is supposed to contain the
kernel image (*uImage* file) and the *bootscript* file, the second partition is supposed to contain the root file system.
When you build a new file system you can delete everything contained on the second partition and you can untar file *.tar.bz2*
to the second partition on the SD card.
If you have built a new kernel just overwrite the old one on the first partition.
In case you have built a new bootloader take a look at :ref:`bootloader_deploy_label`.