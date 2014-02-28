Serial Console
==============

On Tibidabo there is the dedicated serial console connector **CN1** which you can connect, by means
of a mini-USB cable to your personal computer.
On a Linux machine, the console is seen as a ttyUSBX device and you can access to it by means
of an application like *minicom*. If on your system the device has been recognized as **/dev/ttyUSB0**
then you can setup your the port with these parameters:

::

    +-----------------------------------------------------------------------+
    | A -    Serial Device      : /dev/ttyUSB0                              |
    | B - Lockfile Location     : /var/lock                                 |
    | C -   Callin Program      :                                           |
    | D -  Callout Program      :                                           |
    | E -    Bps/Par/Bits       : 115200 8N1                                |
    | F - Hardware Flow Control : No                                        |
    | G - Software Flow Control : No                                        |
    |                                                                       |
    |    Change which setting?                                              |
    +-----------------------------------------------------------------------+
            | Screen and keyboard      |
            | Save setup as dfl        |
            | Save setup as..          |
            | Exit                     |
            | Exit from Minicom        |
            +--------------------------+

otherwise just replace */dev/ttyUSB0* with the proper device
