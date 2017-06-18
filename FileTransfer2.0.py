import shutil
import os
import time
from datetime import datetime, timedelta

class FileCheck():

    def copyFiles():
        srcFiles = os.listdir("/Users/kelli.dircksen/Desktop/Tech Academy/Folder A/")
        src = "//Users/kelli.dircksen/Desktop/Tech Academy/Folder A/"
        dst = "//Users/kelli.dircksen/Desktop/Tech Academy/Folder B/"
        now = int(time.time())
        fileCount = 0
        for _file in srcFiles:
            if int(os.stat(os.path.abspath(src+'%s' % _file)).st_mtime) > (now - 86400):
                shutil.copy2(src+'%s' % _file, dst+'%s' % _file)
                fileCount += 1
        print fileCount, " files copied."

    copyFiles()

if __name__ == "__main__":
    FileCheck()
