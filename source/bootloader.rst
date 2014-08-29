U-boot
======

The bootloader used by Tibidabo is **u-boot**. 
If you want to browse/modify the sources first you have to get them. There are two viable
ways to do that:

* if you already built Tibidabo's bootloader with *Bitbake*, then you already have them on your (virtual) disk, otherwise

* you can download and patch them.

*Bitbake* will place *u-boot* sources under:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-61' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-61" class="language-markup">/path/to/build/tmp/work/tibidabo-poky-linux-gnueabi/u-boot-fslc/v2013.10-r1/git</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

this means that within the virtual machine you will find them under:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-62' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-62" class="language-markup">/home/architech/architech_sdk/architech/tibidabo/yocto/build/tmp/work/tibidabo-poky-linux-gnueabi/u-boot-fslc/v2013.10-r1/git</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>


We suggest you to **don't work under Bitbake build directory**, you will pay a speed penalty
and you can have troubles syncronizing the all thing. Just copy them some place else and do
what you have to do.

If you didn't build them already with *Bitbake*, or you just want to make every step by hand,
you can always get them from the Internet by cloning the proper repository and checking out
the proper commit:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-63' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-63" class="language-markup">cd ~/Documents
 git clone git://github.com/Freescale/u-boot-imx.git
 cd u-boot-imx
 git checkout 079e214888279518ce061c71238a74a0c3db2c28</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

and by properly patching the sources:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-64' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-64" class="language-markup">cd ~/Documents
 git clone -b dora https://github.com/architech-boards/meta-tibidabo.git
 patch -p1 -d u-boot-imx/ &lt; meta-tibidabo/recipes-bsp/u-boot/u-boot-fslc-v2013.10/0001-tibidabo.patch</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Now that you have the sources, you can start browsing the code from the following files:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-65' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-65" class="language-markup">~/Documents/u-boot-imx/board/architech/tibidabo/*
 ~/Documents/u-boot-imx/include/configs/tibidabo.h</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Suppose you modified something and you want to recompile the sources to test your patches, well,
you need a cross-toolchain (see :ref:`manual_compilation_label` Section). If you are not working
with the virtual machine, the most comfortable way to get the toolchain is to ask *Bitbake* for it:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-66' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-66" class="language-markup">bitbake meta-toolchain</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

When *Bitbake* finishes, you will find an install script under directory:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-67' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-67" class="language-markup">/path/to/build/tmp/deploy/sdk/</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Install the script, and you will get under the installation directory a script to source to get your
environment almost in place for compiling. The name of the script is:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-68' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-68" class="language-markup">environment-setup-cortexa9hf-vfp-neon-poky-linux-gnueabi</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Anyway, the environment is not quite right for compiling the bootloader and the Linux kernel, you need
to unset a few variables:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-69' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-69" class="language-markup">unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Ok, now you a working environment to compile *u-boot*, just do:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-610' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-610" class="language-markup">cd ~/Documents/u-boot-imx
 make mrproper
 make tibidabo_config
 make -j &lt;2 * number of processor's cores&gt; all</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

If you omit *-j* parameter, *make* will run one task after the other, if you specify it *make* will parallelize
the tasks execution while respecting the dependencies between them.
Generally, you will place a value for *-j* parameter corresponding to the double of your processor's cores number,
for example, on a quad core machine you will place *-j 8*.

Under the virtual machine, the toolchain is already installed under:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-611' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-611" class="language-markup">/home/architech/architech_sdk/architech/tibidabo/toolchain</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

In the very same directory there is a file, **environment-nofs**, that you can source that takes care of the
environment for you when you want to compile the bootloader or the kernel

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'bootloader_rst-host-612' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="bootloader_rst-host-612" class="language-markup">source /home/architech/architech_sdk/architech/tibidabo/toolchain/environment-nofs</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

Once the build process is complete, you will find **u-boot.imx** file in your sources directory, that's the file
you need to boot the board.
