Network
=======

Tibidabo networking is powered by MARVELL Gigabit switch MV88E6123. On the board there is a dual ethernet connector, each connector has a name
that is printed on the PCB (*P0* and *P1*).
The switch is supported both by *u-boot* and *Linux kernel*, however, *u-boot* support is limited so, if you need u-boot to load files from the 
network use just one of the two ports.
Under Linux, instead, the default network configuration is:

.. raw:: html

 <div>
 <div><b class="admonition-board">&nbsp;&nbsp;Board&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'network_rst-board-271' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="network_rst-board-271" class="language-markup">root@tibidabo:~# ifconfig
 eth0      Link encap:Ethernet  HWaddr 1E:ED:19:27:1A:B3
           UP BROADCAST RUNNING MULTICAST  MTU:1492  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:2 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:0 (0.0 B)  TX bytes:644 (644.0 B)
 
 lo        Link encap:Local Loopback
           inet addr:127.0.0.1  Mask:255.0.0.0
           UP LOOPBACK RUNNING  MTU:16436  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

but if you take a closer look, you discover that there are more interfaces available:

.. raw:: html

 <div>
 <div><b class="admonition-board">&nbsp;&nbsp;Board&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'network_rst-board-272' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="network_rst-board-272" class="language-markup">root@tibidabo:~# ifconfig -a
 eth0      Link encap:Ethernet  HWaddr 1E:ED:19:27:1A:B3
           UP BROADCAST RUNNING MULTICAST  MTU:1492  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:2 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:0 (0.0 B)  TX bytes:644 (644.0 B)
 
 lo        Link encap:Local Loopback
           inet addr:127.0.0.1  Mask:255.0.0.0
           UP LOOPBACK RUNNING  MTU:16436  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
 
 pt0       Link encap:Ethernet  HWaddr 1E:ED:19:27:1A:B3
           BROADCAST MULTICAST  MTU:1492  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
 
 pt1       Link encap:Ethernet  HWaddr 1E:ED:19:27:1A:B3
           BROADCAST MULTICAST  MTU:1492  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

where **pt0** is the network inteface corresponding to connector **P0**, while **pt1** is the
network interface corresponding to connector **P1**.

**eth0** has a random MAC address assigned and, as you can see, *pt0* and *pt1* have the same address.
To properly use the network you need to be sure that *pt0* and *pt1* have unique MAC addresses.
You can change the MAC address of a specific network interface by means of this command:

.. raw:: html

 <div>
 <div><b class="admonition-board">&nbsp;&nbsp;Board&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'network_rst-board-273' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="network_rst-board-273" class="language-markup">ifconfig &lt;port&gt; hw ether &lt;new mac address&gt;</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>


substitute *<port>* with *pt0* or *pt1*, and *<new mac address>* with the MAC address you decided to assign.

If you want that configuration to be brought up at boot you can add a few line in file */etc/network/interfaces*, for
example, if you want *pt0* to have a fixed ip address (say 192.168.0.10) and MAC address of value 1e:ed:19:27:1a:b6
you could add the following lines:

.. raw:: html

 <div>
 <div><b class="admonition-board">&nbsp;&nbsp;Board&nbsp;&nbsp;</b>&nbsp;&nbsp;<a style="float: right;" href="javascript:select_text( 'network_rst-board-274' );">select</a></div>
 <pre class="line-numbers pre-replacer" data-start="1"><code id="network_rst-board-274" class="language-markup">auto pt0
 iface pt0 inet static
     address 192.168.0.10
     netmask 255.255.255.0
     hwaddress ether 1e:ed:19:27:1a:b6</code></pre>
 <script src="_static/prism.js"></script>
 <script src="_static/select_text.js"></script>
 </div>

You can, of course, define the default configuration for *pt1* as well.