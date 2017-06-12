import shutil
import os
import glob
import time
import datetime


def copyFilesA(srcDir, destDir):
    destDir = "C:/Users/Gowenburnett/Desktop/Folder B"
    srcDir = "C:/Users/Gowenburnett/Desktop/Folder A/*.txt"
    for files in glob.glob(r"srcDir"):
        print files
        shutil.move(files, destDir)


def copyFilesB():
    destDir = "D:\Documents\Folder A"
    for files in glob.glob(r"/Users/kelli.dircksen/Desktop/Folder A/*.txt"): 
        print files
        shutil.move(files, destDir)


def fileInfo():
    info = os.stat('/Users/kelli.dircksen/Desktop/Folder A/fileX.txt')
    print info
    print info.st_mtime


def makeList():
    fileList =[]
    fileDir = '/Users/kelli.dircksen/Desktop/Folder A/'
    for files in os.listdir(fileDir):
        print files
        fileInfo = os.stat(os.path.join(fileDir, files)) 
        fileList.append([files, time.ctime(fileInfo.st_mtime)]) 
        for files in fileList:
            print fileInfo.st_mtime, files


def findTime(unixTime):
    print datetime.fromtimestamp(unixTime).strftime('%H:%M')


def fileX():
    fileXinfo = os.stat('/Users/kelli.dircksen/Desktop/Folder A/fileX.txt') 
    fileXtime = fileXinfo.st_mtime 
    d = time.localtime() 
    print datetime.datetime.fromtimestamp(fileXtime).strftime("%H:%M") 
    print d.tm_hour 
    if fileXinfo.st_mtime < datetime.datetime.now:
        print True
    else:
        print False

#copyFilesA()
#copyFilesB()
#fileInfo()
makeList()
#fileX()
