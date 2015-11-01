# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'USBreadboardIT\usbreadboardit.ui'
#
# Created: Mon Oct 05 21:39:30 2015
#      by: pyside-uic 0.2.15 running on PySide 1.2.2
#
# WARNING! All changes made in this file will be lost!


import sys
import hid
from PySide import QtCore, QtGui
import time


class Display(QtGui.QWidget):
    def __init__(self, parent=None):
        super(Display, self).__init__(parent)

        hbox = QtGui.QHBoxLayout()
        grid_left = QtGui.QGridLayout()
        grid_right = QtGui.QGridLayout()

        self.red = QtGui.QPixmap("images/statusRed.png").scaled(QtCore.QSize(30, 30))
        self.green = QtGui.QPixmap("images/statusGreen.png").scaled(QtCore.QSize(30, 30))

        self.colors = [self.red, self.green]

        self.pins = ["GND1", "D-", "D+", "GND4", "RC0", "RC1", "RC2",
                     "RC3", "RC4", "RC5", "RA3", "RA4", "RA5", "VDD"]

        self.button_toggle = {'RC0': QtGui.QPushButton("TOGGLE"),
                              'RC1': QtGui.QPushButton("TOGGLE"),
                              'RC2': QtGui.QPushButton("TOGGLE"),
                              'RC3': QtGui.QPushButton("TOGGLE"),
                              'RC4': QtGui.QPushButton("TOGGLE"),
                              'RC5': QtGui.QPushButton("TOGGLE"),
                              'RA3': QtGui.QPushButton("TOGGLE"),
                              'RA4': QtGui.QPushButton("TOGGLE"),
                              'RA5': QtGui.QPushButton("TOGGLE")}

        self.button_pulse = {'RC0': QtGui.QPushButton("PULSE"),
                             'RC1': QtGui.QPushButton("PULSE"),
                             'RC2': QtGui.QPushButton("PULSE"),
                             'RC3': QtGui.QPushButton("PULSE"),
                             'RC4': QtGui.QPushButton("PULSE"),
                             'RC5': QtGui.QPushButton("PULSE"),
                             'RA3': QtGui.QPushButton("PULSE"),
                             'RA4': QtGui.QPushButton("PULSE"),
                             'RA5': QtGui.QPushButton("PULSE")}

        self.status = {'RC0': QtGui.QLabel(self),
                       'RC1': QtGui.QLabel(self),
                       'RC2': QtGui.QLabel(self),
                       'RC3': QtGui.QLabel(self),
                       'RC4': QtGui.QLabel(self),
                       'RC5': QtGui.QLabel(self),
                       'RA3': QtGui.QLabel(self),
                       'RA4': QtGui.QLabel(self),
                       'RA5': QtGui.QLabel(self),
                       'GND1': None, 'GND4': None, 'D-': None, 'D+': None, 'VDD': None}

        self.label = {'GND1': QtGui.QLabel("GROUND"),
                      'D-': QtGui.QLabel("D-"),
                      'D+': QtGui.QLabel("D+"),
                      'GND4': QtGui.QLabel("GROUND"),
                      'RC0': QtGui.QLabel("RC0"),
                      'RC1': QtGui.QLabel("RC1"),
                      'RC2': QtGui.QLabel("RC2"),
                      'RC3': QtGui.QLabel("RC3"),
                      'RC4': QtGui.QLabel("RC4"),
                      'RC5': QtGui.QLabel("RC5"),
                      'RA3': QtGui.QLabel("RA3"),
                      'RA4': QtGui.QLabel("RA4"),
                      'RA5': QtGui.QLabel("RA5"),
                      'VDD': QtGui.QLabel("VDD")}

        for key in self.label:
            self.label[key].setMinimumHeight(30)

        # #### LEFT GRID #### #

        grid_left.setRowStretch(0, 1)
        # Pin 1: GND
        for i in range(7):
            key = self.pins[i]
            j = i + 1
            if(self.status[key] is not None):
                grid_left.addWidget(self.button_pulse[key], j, 1)
                self.button_pulse[key].clicked.connect(lambda key=key: self.sendPulse(key))
                grid_left.addWidget(self.button_toggle[key], j, 2)
                self.button_toggle[key].clicked.connect(lambda key=key: self.sendToggle(key))
                grid_left.addWidget(self.label[key], j, 3)
                grid_left.addWidget(self.status[key], j, 4)
                self.status[key].setPixmap(self.red)
            else:
                grid_left.addWidget(self.label[key], j, 3, 1, 2)

        # #### CENTER IMAGE #### #
        vbox = QtGui.QVBoxLayout()
        QI = QtGui.QImage("images/board.png").scaled(QtCore.QSize(380, 380))
        boardImg = QtGui.QLabel(self)
        boardImg.setPixmap(QtGui.QPixmap.fromImage(QI))
        vbox.addStretch(1)
        vbox.addWidget(boardImg)

        # #### RIGHT GRID #### #
        grid_right.setRowStretch(0, 1)

        for i in range(7):
            key = self.pins[i + 7]
            j = 14 - i
            if(self.status[key] is not None):
                grid_right.addWidget(self.status[key], j, 1)
                self.status[key].setPixmap(self.red)
                grid_right.addWidget(self.label[key], j, 2)
                grid_right.addWidget(self.button_toggle[key], j, 3)
                self.button_toggle[key].clicked.connect(lambda key=key: self.sendToggle(key))
                grid_right.addWidget(self.button_pulse[key], j, 4)
                self.button_pulse[key].clicked.connect(lambda key=key: self.sendPulse(key))
            else:
                grid_right.addWidget(self.label[key], j, 1, 1, 4)

        hbox.addLayout(grid_left)
        hbox.addLayout(vbox)
        hbox.addLayout(grid_right)

        self.setLayout(hbox)

        self.setWindowTitle("USBreadboardIT")
        # -self.setWindowState(QtCore.Qt.WindowMaximized)

        self.offset = {'RC0': 30,
                       'RC1': 31,
                       'RC2': 32,
                       'RC3': 33,
                       'RC4': 34,
                       'RC5': 35,
                       'RA3': 13,
                       'RA4': 14,
                       'RA5': 15}

        self.g = hid.device()
        self.g.open(vendor_id=0xA0A0, product_id=0x0009)
        self.g.write([0x00, 0x02, 0x00, 0x00, 0x00])  # Set mode
        self.g.write([0x00, 0x03])  # Get value
        x = self.g.read(4)
        print(x)

        for i in range(14):
            key = self.pins[i]
            if self.status[key] is not None:
                status = (x[self.offset[key] / 10] >> (self.offset[key] % 10)) & 0x01
                self.status[key].setPixmap(self.colors[status])

    def __del__(self):
        self.g.close()

    @QtCore.Slot()
    def sendPulse(self, pin):
        print("PULSE on %s" % pin)
        self.g.write([0x00, 0x08, self.offset[pin], 0x01])
        time.sleep(0.2)
        self.g.write([0x00, 0x08, self.offset[pin], 0x00])

    @QtCore.Slot()
    def sendToggle(self, pin):
        print("TOGGLE on %s" % pin)
        self.g.write([0x00, 0x03])  # Get value
        x = self.g.read(4)
        status = (x[self.offset[pin] / 10] >> (self.offset[pin] % 10)) & 0x01

        if(status == 0x01):
            x[self.offset[pin] / 10] &= ~(0x01 << (self.offset[pin] % 10))
        else:
            x[self.offset[pin] / 10] |= (0x01 << (self.offset[pin] % 10))

        response = [0x00, 0x04, x[1], x[2], x[3]]
        self.g.write(response)  # Set mode

if __name__ == '__main__':

    app = QtGui.QApplication(sys.argv)
    clock = Display()
    clock.show()
    sys.exit(app.exec_())
