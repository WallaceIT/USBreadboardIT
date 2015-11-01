USBreadboardIT board files and test firmware+software

The firmware is based on [m-stack](https://github.com/signal11/m-stack) by signal11 and can be opened in MPLAB X and compiled with the XC8 compiler by Microchip.
Please note that the enclosed project is pre-configured with ROM settings to be used with the 512-words [DFU booloader](https://github.com/majbthrd/PIC16F1-USB-DFU-Bootloader) by majbthrd, but can easily be adapted to be uploaded through ICSP (just remove the 'ROM ranges' and 'Codeoffset' options).

The software, written in python, requires [PySide](https://github.com/PySide/PySide) and [cython-hidapi](https://github.com/trezor/cython-hidapi), both installable through pip either on Windows or Linux.

Work in progress, see the [hackaday.io page](https://hackaday.io/project/7921-usbreadboardit) for details
