from tkinter import *
from tkinter import ttk

#############################################

# Author: Jason Kralik
# Purpose: Automate Screencapture taking & management
#  Python Version using TKinter for GUI
# FileName: 51-Screencapture.py
# Created: 06/16/18
# Modifed:

#############################################

# ------------ MULTIPLE COMPONENTS -------------
# Some of the different Widgets : Button, Label,
# Canvas, Menu, Text, Scale, OptionMenu, Frame,
# CheckButton, LabelFrame, MenuButton, PanelWindow,
# Entry, ListBox, Message, RadioButton, ScrollBar,
# BitMap, SpinBox, Image

root = Tk()  # 'root' defined here as a TK object (main window)

root.title("First GUI")  # 'title' on top of 'root' window

######
# ttk.Button(root, text="Hello TkInter").grid() # button inside of 'root' window

#######
frame = Frame(root)  # 'Frame' widget (obj) to surround other widgets (objs)
labelText = StringVar()  # Tkinter variable
# Compare 'label' w/ 'label2' (next 2 lines) --
# This creates an object that is 'set' below in 'labelText.set()'
label = Label(frame, textvariable=labelText)
label2 = Label(frame, text="label2")
button = Button(frame, text="Click Me")

labelText.set("I am a label")

label.pack()
label2.pack()
button.pack()
frame.pack()

#######

root.mainloop()  # 'mainloop' keeps window open
