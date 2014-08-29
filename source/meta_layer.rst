Meta Layer
==========

A Yocto/OpenEmbedded meta-layer is a directory that contains recipes, configuration files, patches, etc., all needed by
*Bitbake* to properly "see" and build a BSP, a distribution, a (set of) package(s), whatever.
**meta-tibidabo** is a meta-layer which defines the customizations to make to Freescale's i.MX6 BSP and Yocto/OpenEmbedded
in order to get a working system, tailor made of Tibidabo.

You can get it with *git*:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'meta_layer_rst-host-71' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="meta_layer_rst-host-71" class="language-markup">git clone -b dora https://github.com/architech-boards/meta-tibidabo.git</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

The machine name for Tibidabo is **tibidabo**.

The strictly BSP related recipes are located under:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'meta_layer_rst-host-72' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="meta_layer_rst-host-72" class="language-markup">meta-tibidabo/recipes-bsp/u-boot/
 meta-tibidabo/recipes-bsp/bootscript/
 meta-tibidabo/recipes-kernel/linux/</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

The other recipes are there just to customize other aspects of the system or to offer some facility to help you easily
manage some task, for example, working with flash memory or partitions.

Tibidabo is powered by a big serial NOR memory, big enough to place a full featured root file system inside of it.
However, you might not be interested in how to place the file system inside of it from the beginning and how to mount and
unmount it inside your file system.
There is a recipe inside meta-tibidabo, **tibidabo-flash-utils**, that will install three scripts inside the target file system
to make the aforementioned tasks easy:

* *tibidabo_fs2flash*

* *tibidabo_mount_flash*

* *tibidabo_umount_flash*

*tibidabo_fs2flash* takes as input a *.tar.bz2* file, cleans and formats the flash memory, and finally takes the file you gave
him to setup the root file system. For more information just run:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'meta_layer_rst-host-73' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="meta_layer_rst-host-73" class="language-markup">tibidabo_fs2flash -h</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

from Tibidabo shell.

*tibidabo_mount_flash* lets you mount the flash memory partition inside your filesystem (under */mnt/flash*) without any effort
and, likewise, *tibidabo_umount_flash* helps you unmounting the partition.

Remember that to install those scripts inside the target, you need to add **meta-openmbedded/meta-oe** meta layer to your *bblayers.conf*
file. If you are working with Architech virtual machine, you don't have to worry about that, everything is already in place.

*tibidabo-flash-utils* won't be placed by default inside your file system, if you want it you need to add a line like this one
to your *local.conf* file

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'meta_layer_rst-host-74' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="meta_layer_rst-host-74" class="language-markup">IMAGE_INSTALL_append = " tibidabo-flash-utils"</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Probably the most comfortable way, at least at the beginning, to build a valid SD card or SATA disk is to use file *.sdcard* that
*Bitbake* emits when builds an image. However, *Bitbake* prepares a final iso image to write to the medium without any knowledge of
its size. If you write the image on an SD card, for example, the first thing you notice is that the file system does not fit the card.
How do you resize partitions and file systems to get the best out of your device?
You have two possibilities:

1) put your SD card into your computer and use some tool, however, this option is available only on a Linux machines, or

2) resize the file system directly on the target board.

*meta-tibidabo* has a recipe, **tibidabo-resize-partition**, that puts a script inside the target file system that does **online resizing
of the last partition** on the medium (that must be a *primary partition*), which can be an SD card, an mSATA hard disk, or an USB memory stick.
The script name is **tibidabo_resize_partition**, to see the help just type:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'meta_layer_rst-host-75' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="meta_layer_rst-host-75" class="language-markup">tibidabo_resize_partition -h</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

on Tibidabo's console.

An example for resizing the SD card iso image generated by *Bitbake*, can be:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'meta_layer_rst-host-76' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="meta_layer_rst-host-76" class="language-markup">tibidabo_resize_partition -d /dev/mmcblk0 -p 2</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

then follow the instructions, if any.

Even *tibidabo-resize-partition* won't be placed by default inside the final root file system, unless you asks *Bitbake* for it, by
adding the following line to your build directory *local.conf* file:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'meta_layer_rst-host-77' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="meta_layer_rst-host-77" class="language-markup">IMAGE_INSTALL_append = " tibidabo-resize-partition"</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>
