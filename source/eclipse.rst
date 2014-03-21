Eclipse IDE
===========

Eclipse is an integrated development environment (IDE). It contains a base workspace and the Yocto plug-in system to compile and debug a program for the tibidabo board.
Hereafter, the operating system that runs the IDE/debugger will be named host machine, and the board being debugged will be named target machine.
The host machine could be running as a virtual machine guest operating system, anyway, the documentation for the host machine running as a guest operating system and as host operating system is exactly the same.

Pay attention before to start writing your application you need:

* a filesystem (you can use bitbake/hob to build your preferred filesystem) with develop support (that is, it must include all the necessary header files, the *tcf-agent* program and *gdbserver*)

* an SD card already partitioned, with the bootloader in the FAT partition, and

* a network connect between the host machine and the target machine.

.. index:: Project

Creating the Project
--------------------

You can create two types of projects: Autotools-based, or Makefile-based. This section describes how to create Autotools-based projects from within the **Eclipse IDE**.
Launch Eclipse using Architech Splashscreen just click on **Develop with Eclipse**.

.. image:: _static/run_eclipse.png

To create a project based on a Yocto template and then display the source code, follow these steps:

* Select File→New→Project...
* Under *C/C++*, double click on *C Project* to create the project.
* Click on "Next" button
* Expand *Yocto Project ADT Autotools Project*.
* Select *Hello World ANSI C Autotools Project*. This is an Autotools-based project based on a Yocto Project template.

.. image:: _static/newproject.jpg

* Put a name in the Project *name:* field. Do not use hyphens as part of the name.
* Click *Next*.
* Add information in the *Author* and *Copyright* notice fields.
* Be sure the *License* field is correct.
* Click *Finish*.

**Note:** If the "open perspective" prompt appears, click *Yes* so that you enter in the C/C++ perspective.
The left-hand navigation pane shows your project. You can display your source by double clicking the project's source file.

.. image:: _static/projectexplorer.jpg
 
* Select *Project→Properties→Yocto Project Settings* and check *Use project specific settings*

.. image:: _static/projectsetting.jpg

Building the Project
--------------------

To build the project, select Project→Build Project. The console should update with messages from the cross-compiler.
To add more libraries to compile:

* Click on Project→Properties.
* Expand the box next to Autotools.
* Select Configure Settings.
* In CFLAGS field, you can add the path of includes with -Ipath_include
* In LDFLAGS field, you can specify the libraries you use with -lname_library and you can also specify the path where to look for libraries with -Lpath_library
* Click on Project→Build All to compile the project

**Note:** All libraries must be located in *architech_sdk/architech/tibidabo/sysroot* subdirectories.

.. image:: _static/autotools.jpg

.. index:: Debug

Deploying and Debugging the Application
---------------------------------------

Connect the tibidabo board to the PC by means of a usb cable to power the board and to have the serial console. Once you built the project and the board is running the image, use minicom to run **tcf-agent** program in target board:

::

 Yocto (Built by Poky 7.0.1) 1.2.1                                               
  ttyO0                                                                          
                                                                                
 tibidabo login: root                                                             
 root@tibidabo:~# /etc/init.d/tcf-agent restart

On the Host machine, follow these steps to let **Eclipse** deploy and debug your application:

* Select Run→Debug Configurations...
* In the left area, expand *C/C++Remote Application*.
* Locate your project and select it to bring up a new tabbed view in the *Debug Configurations* Dialog.

.. image:: _static/debugform.jpg

* Insert in *C/C++ Application* the path and the name file where is the binary compiled.
* Click on "New" button near the drop-down menu in the *Connection* field.
* Select *TCF* icon.

.. image:: _static/tcf1.jpg

* Insert in *Host Name* and *Connection Name* fields the IP address of the target board. (e.g. 192.168.0.10)

.. image:: _static/tcf2.jpg

* Then press *Finish*.

* Use the drop-down menu now in the *Connection* field and pick the IP Address you entered earlier.

* Enter the absolute path on the target into which you want to deploy the application. Use the *Browse* button near *Remote Absolute File Path for C/C++Application:* field. No password is needed.

.. image:: _static/remotepath.png

* Enter also in the path the name of the application you want to debug. (e.g. Hello)

.. image:: _static/debug2.jpg

* Select *Debugger* tab

.. image:: _static/gdb.jpg

* In GDB Debugger field insert the absoulute path where is located the gdb program of the toolchain. (e.g."/home/architech/architech_sdk/architech/tibidabo/toolchain/sysroots/i686-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb")

* In *Debugger* window there is the tab named *Shared Library*, click on its.
* Add the libraries path "lib" and "usr/lib" of the rootfs (e.g. "/home/architech/architech_sdk/architech/tibidabo/sysroot/lib"). These libraries must be the same used in the target board.

.. image:: _static/libs.jpg

* Click *Debug* to bring up a login screen and login.
* Accept the debug perspective. 

.. important::

	If debug does not works, check if tcf-agent is running on the board and gdbserver is present.

