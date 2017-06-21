from tkinter import *
from tkinter import ttk as ttk, messagebox, filedialog
from datetime import datetime, timedelta
import os
import time
import shutil
from glob import glob
import sqlite3


def createFileTransfer():
    db = sqlite3.connect('FileCheck.db')
    print('Opened database successfully!')
    db.execute('DROP TABLE IF EXISTS FileTransfer')
    db.execute('CREATE TABLE IF NOT EXISTS FileTransfer (ID INTEGER PRIMARY KEY AUTOINCREMENT, fcTime TEXT)')
    print ('Created table successfully!')
    db.commit()


class FileCheck:

    def __init__(self, master):

        self.frame_header = ttk.Frame(master)
        self.frame_header.pack()
        
        self.dailyFolderName = StringVar()
        print (self.dailyFolderName)
        self.daily = (self.dailyFolderName.get())

        self.destFolderName = StringVar()
        print (self.destFolderName)
        self.dest = (self.destFolderName.get())

        self.fcTimestamp = StringVar()
        print (self.fcTimestamp)
        self.fcT = (self.fcTimestamp.get())
        

        titleLabel = ttk.Label(self.frame_header, text = 'Please follow the steps below! ', font = 'bold')
        titleLabel.grid(row = 0, column = 0, columnspan = 2, pady = 5, sticky = 'w')


        self.frame_steps = ttk.Frame(master)
        self.frame_steps.pack()


        dailyStepLabel = ttk.Label(self.frame_steps, text = 'Step 1- Choose Daily Folder')
        dailyStepLabel.grid(row = 0, column = 0, columnspan = 2, pady = 5, sticky = 'w')
        destStepLabel = ttk.Label(self.frame_steps, text = 'Step 2- Choose Destination Folder')
        destStepLabel.grid(row = 3, column = 0, columnspan = 2, pady = 5, sticky = 'w')
        initiateStepLabel = ttk.Label(self.frame_steps, text = 'Step 3- Initiate File Check')
        initiateStepLabel.grid(row = 7, column = 0, columnspan = 2, pady = 5, sticky = 'w')
        

        dailyButton = ttk.Button(self.frame_steps, text = 'Daily Folder', command = self.selectDailyFolder)
        dailyButton.grid(row = 1, column = 0, sticky = 'w')
        destButton = ttk.Button(self.frame_steps, text = 'Destination Folder', command = self.selectDestFolder)
        destButton.grid(row = 4, column = 0, sticky = 'w')
        initiateButton = ttk.Button(self.frame_steps, text = 'Initiate', command = lambda: self.timeCompare(self.dailyFileCheck,self.destFileCheck))
        initiateButton.grid(row = 8, column = 0, sticky = 'w')
        

        self.frame_path = ttk.Frame(master)
        self.frame_path.pack()
        dailyPathLabel = ttk.Label(self.frame_steps, text = self.dailyFolderName, textvariable = self.dailyFolderName)
        dailyPathLabel.grid(row = 1, column = 2, rowspan = 1, sticky = 'W')
        dailyPathLabel.config(foreground = 'blue')
        destPathLabel = ttk.Label(self.frame_steps, text = self.destFolderName, textvariable = self.destFolderName)
        destPathLabel.grid(row = 4, column = 2, rowspan = 1, sticky = 'W')
        destPathLabel.config(foreground = 'blue')


        fcTimeTitleLabel = ttk.Label(self.frame_steps, text = 'Last File Check: ')
        fcTimeTitleLabel.grid(row = 7, column = 2, sticky = 'W' )
        fcTimestampLabel = ttk.Label(self.frame_steps, textvariable = self.fcTimestamp)
        fcTimestampLabel.grid(row = 8, column = 2, rowspan = 1, sticky = 'W')
        fcTimestampLabel.config(foreground = 'blue')               
        
    def selectDailyFolder(self):
        self.dailyFileCheck = filedialog.askdirectory(initialdir = "D:\Documents", title = "Select your Daily Folder")
        self.dailyFolderName.set(self.dailyFileCheck)
        print (self.dailyFileCheck)
        print (self.dailyFolderName.get())
        
       
    def selectDestFolder(self):
        self.destFileCheck = filedialog.askdirectory(initialdir = "D:\Documents", title = "Select your Destination Folder")
        self.destFolderName.set(self.destFileCheck)
        print (self.destFileCheck)
        print (self.destFolderName.get())


    def timeCompare(self, dailyFileCheck, destFileCheck):
        print ('Your Daily Folder: {}'.format(dailyFileCheck))
        print ('Your Destination Folder: {}'.format(destFileCheck)) 
        print ()
        currentTime = datetime.now() 
        time24hoursAgo = currentTime - timedelta(hours = 24) 
        for f in os.listdir(dailyFileCheck): 
            files = os.path.realpath(os.path.join(dailyFileCheck,f)) 
            if files.endswith('.txt'):
                fileSrcModifiedTime = datetime.fromtimestamp(os.path.getmtime(files)) 
                if fileSrcModifiedTime > time24hoursAgo: 
                    print (files, "copied to: ", destFileCheck)
                    shutil.copy(files,destFileCheck) 
                else:
                    print (files, "not copied")
                    
        self.fileCheckdb()               

    def fileCheckdb(self):
        self.db = sqlite3.connect('fileCheck.db')
        print('Opened Timestamp database successfully!')
        self.db.execute("INSERT INTO FileTransfer (fcTime) VALUES (datetime(CURRENT_TIMESTAMP, 'localtime'))")
        print('Timestamp inserted')
        self.db.commit()
        self.cursor = self.db.execute('SELECT fcTime FROM FileTransfer ORDER BY ID DESC LIMIT 1')
        for row in self.cursor:
            print ('Last File Check: ',row)
            self.fcClock = self.fcTimestamp.set(row)
            
            
        self.db.close()
        print ('Database closed')  


if __name__ == '__main__' :
    root = Tk()
    root.wm_title("File Check")
    FileCheck = FileCheck(root)
    root.mainloop()
    createFileTransfer()
    
