To deploy the root file system, you are going to need a micro SD card.

1. Copy the root file system to your SD card

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'deploy_rootfs_rst-host-61' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="deploy_rootfs_rst-host-61" class="language-markup">sudo dd if=~/architech_sdk/architech/tibidabo/yocto/tmp/deploy/images/core-image-minimal-dev-tibidabo.sdcard of=/path/to/your/sd/card/device</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

.. warning::

 Be very careful when you use *dd* to write to a device to pick up the right device, otherwise you can mess up another disk you have on your machine, destroying its content forever!

.. warning::
 
 The content of the SD card will be lost forever!

.. important::

 Be sure you **unmount the device** from the filesystem before using **dd** program, you sure don't want to have the operating system interfere during the write process.

2. After *dd* completes, make sure everything has been really written to the SD card:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'deploy_rootfs_rst-host-62' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="deploy_rootfs_rst-host-62" class="language-markup">sync</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

3. Unmount the micro SD card from your computer

4. Plug the micro SD in the board socket.
