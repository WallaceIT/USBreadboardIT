# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'USBreadboardIT\usbreadboardit.ui'
#
# Created: Mon Oct 05 21:39:30 2015
#      by: pyside-uic 0.2.15 running on PySide 1.2.2
#
# WARNING! All changes made in this file will be lost!


import sys
from PySide import QtCore, QtGui


class Display(QtGui.QWidget):
    def __init__(self, parent=None):
        super(Display, self).__init__(parent)

        hbox = QtGui.QHBoxLayout()
        grid_left = QtGui.QGridLayout()
        grid_right = QtGui.QGridLayout()

        red = QtGui.QPixmap("images/statusRed.png").scaled(QtCore.QSize(30, 30))

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
                self.status[key].setPixmap(red)
            else:
                grid_left.addWidget(self.label[key], j, 3, 1, 2)
        """
        grid_left.addWidget(self.label[self.pins[1]], 1, 3, 1, 2)
        # Pin 2:  D-
        grid_left.addWidget(self.label[self.pins[2]], 2, 3, 1, 2)
        # Pin 3:  D+
        grid_left.addWidget(self.label[self.pins[3]], 3, 3, 1, 2)
        # Pin 4: GROUND
        grid_left.addWidget(self.label[self.pins[4]], 4, 3, 1, 2)
        # Pin 5: RC0
        grid_left.addWidget(self.button_pulse[self.pins[5]], 5, 1)
        grid_left.addWidget(self.button_toggle[self.pins[5]], 5, 2)
        grid_left.addWidget(self.label[self.pins[5]], 5, 3)
        grid_left.addWidget(self.status[self.pins[5]], 5, 4)
        # Pin 6: RC1
        grid_left.addWidget(self.button_pulse[self.pins[6]], 6, 1)
        grid_left.addWidget(self.button_toggle[self.pins[6]], 6, 2)
        grid_left.addWidget(self.label[self.pins[6]], 6, 3)
        grid_left.addWidget(self.status[self.pins[6]], 6, 4)
        # Pin 7: RC2
        grid_left.addWidget(self.button_pulse[self.pins[7]], 7, 1)
        grid_left.addWidget(self.button_toggle[self.pins[7]], 7, 2)
        grid_left.addWidget(self.label[self.pins[7]], 7, 3)
        grid_left.addWidget(self.status[self.pins[7]], 7, 4)
        """

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
                self.status[key].setPixmap(red)
                grid_right.addWidget(self.label[key], j, 2)
                grid_right.addWidget(self.button_toggle[key], j, 3)
                self.button_toggle[key].clicked.connect(lambda key=key: self.sendToggle(key))
                grid_right.addWidget(self.button_pulse[key], j, 4)
                self.button_pulse[key].clicked.connect(lambda key=key: self.sendPulse(key))
            else:
                grid_right.addWidget(self.label[key], j, 1, 1, 4)

        """
        # Pin 14: VDD
        grid_right.addWidget(self.label[self.pins[14]], 1, 1, 1, 4)
        # Pin 13: RA5
        grid_right.addWidget(self.status[self.pins[13]], 2, 1)
        grid_right.addWidget(self.label[self.pins[13]], 2, 2)
        grid_right.addWidget(self.button_toggle[self.pins[13]], 2, 3)
        grid_right.addWidget(self.button_pulse[self.pins[13]], 2, 4)
        # Pin 12: RA4
        grid_right.addWidget(self.status[self.pins[12]], 3, 1)
        grid_right.addWidget(self.label[self.pins[12]], 3, 2)
        grid_right.addWidget(self.button_toggle[self.pins[12]], 3, 3)
        grid_right.addWidget(self.button_pulse[self.pins[12]], 3, 4)
        # Pin 11: RA3 / MCLR#
        grid_right.addWidget(self.status[self.pins[11]], 4, 1)
        grid_right.addWidget(self.label[self.pins[11]], 4, 2)
        grid_right.addWidget(self.button_toggle[self.pins[11]], 4, 3)
        grid_right.addWidget(self.button_pulse[self.pins[11]], 4, 4)
        # Pin 10: RC5
        grid_right.addWidget(self.status[self.pins[10]], 5, 1)
        grid_right.addWidget(self.label[self.pins[10]], 5, 2)
        grid_right.addWidget(self.button_toggle[self.pins[10]], 5, 3)
        grid_right.addWidget(self.button_pulse[self.pins[10]], 5, 4)
        # Pin 9: RC4
        grid_right.addWidget(self.status[self.pins[9]], 6, 1)
        grid_right.addWidget(self.label[self.pins[9]], 6, 2)
        grid_right.addWidget(self.button_toggle[self.pins[9]], 6, 3)
        grid_right.addWidget(self.button_pulse[self.pins[9]], 6, 4)
        self.button_pulse[self.pins[9]].clicked.connect(lambda: self.sendPulse(self.pins[9]))
        self.button_toggle[self.pins[9]].clicked.connect(lambda: self.sendToggle(self.pins[9]))
        # Pin 8: RC3
        grid_right.addWidget(self.status[self.pins[8]], 7, 1)
        grid_right.addWidget(self.label[self.pins[8]], 7, 2)
        grid_right.addWidget(self.button_toggle[self.pins[8]], 7, 3)
        grid_right.addWidget(self.button_pulse[self.pins[8]], 7, 4)
        """

        hbox.addLayout(grid_left)
        hbox.addLayout(vbox)
        hbox.addLayout(grid_right)

        self.setLayout(hbox)

        self.setWindowTitle("USBreadboardIT")
        # -self.setWindowState(QtCore.Qt.WindowMaximized)

    @QtCore.Slot()
    def sendPulse(self, pin):
        print("PULSE on %s" % pin)

    @QtCore.Slot()
    def sendToggle(self, pin):
        print("TOGGLE on %s" % pin)

if __name__ == '__main__':

    app = QtGui.QApplication(sys.argv)
    clock = Display()
    clock.show()
    sys.exit(app.exec_())
