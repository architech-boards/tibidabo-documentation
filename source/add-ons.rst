*******
Add-ons
*******

Huawei MU609
============

MU609 is high-quality designed HSPA module in small size and Huawei standard
LGA form factor which is specially designed for industrial-grade M2M applications such
as vehicle telematics, tracking, mobile payment, industrial router, safety
monitor and industrial PDAs.
Tibidabo sources can be easily updated to support MU609.

Download the `kernel patch <_static/0002-tibidabo-huawei.patch>`_ and 
`the configuration fragment <_static/huawei-mu609.cfg>`_ to *~/Documents*.
Be sure you followed the guide on Tibidabo :ref:`linux kernel <linux-kernel>`, 
and once you have prepared the kernel sources to be compiled by hand you can
apply the patches:

.. raw:: html

 <div>
 <div><b class="admonition-host">&nbsp;&nbsp;Host&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'add_ons_rst-host-11' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="add_ons_rst-host-11" class="language-markup">patch -p1 -d ~/Documents/linux-2.6-imx/ &lt; ~/Documents/0002-tibidabo-huawei.patch</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

To make the device work properly, make sure the Linux kernel is configured according
to the configuration fragment file (~/Documents/huawei-mu609.cfg) you just downloaded.

.. note::

 The patches have been tested with module MU609 programmed with firmware version 12.105.29.00.00