hub-ctrl.c
==========

Control USB power on a port by port basis on some USB hubs.

Originally created NIIBE Yutaka and published to Github by Joel Dare on January
31st, 2013.

This only works on USB hubs that have the hardware necessary to allow
software controlled power switching. Most hubs DO NOT include the hardware.

Prerequisites
=============

Before compiling it, you'll need to install libusb-dev (under Ubuntu). I
installed that with the following command.

    sudo apt-get install libusb-dev

You'll also need the GCC tool chain.

Compiling
=========

To compile the hub-ctrl.c program run the following compile command.

    gcc -o hub-ctrl hub-ctrl.c -lusb

That results in an executable binary called hub-ctrl.

Controlling Power
=================

You can control the power on a port using the following command.

    sudo ./hub-ctrl -h 3 -P 1 -p 0

That says to control hub 3 (-h 3) port 1 (-P 1) and to turn the power
off (-p 0). You can also use ”-p 1” to turn the power back on.

You can also specify the USB device based on the BUS and DEV numbers. Use the
following command the list the currently connected devices. It's useful to run
this with the device disconnected and then again with the device connected so
that you can tell which device is the one you are trying to target (the Targus
in my case).

    lsusb

Now that we know the BUS and DEV numbers, we can control the power using those
numbers as well. Here's the command for that.

    sudo ./hub-ctrl -b 001 -d 005 -P1 -p 0

This time we are controlling the device on BUS 001 (-b 001) device 005 (-d 005)
port 1 (-P 1) and turning the power off (-p 0).

Hubs Known to Work
==================

The following is a list of Hubs that are known to have the hardware necessary
to allow power switching.

  - D-Link-DUB-H7-High-Speed-7-Port (Tested with old Silver versions (A3, A4 & A5). Also tested with newer Black version C1).
  - Elecom: U2H-G4S
  - Sanwa Supply: USB-HUB14GPH
  - Targus, Inc.: PAUH212
  - Hawking Technology: UH214
  - B+B SmartWorx: UHR204
  - Belkin: F5U701
  - Linksys: USB2HUB4

Original Copyright
==================

Copyright (C) 2006 Free Software Initiative of Japan

Author: NIIBE Yutaka  <gniibe at fsij.org>

This file can be distributed under the terms and conditions of the GNU General
Public License version 2 (or later).
