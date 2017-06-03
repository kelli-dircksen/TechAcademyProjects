import shutil
import glob

def moveFiles():
    destDir = "/Users/kelli.dircksen/Desktop/Folder B"
    for file in glob.glob(r"/Users/kelli.dircksen/Desktop/Folder A/*.txt"):
        print (file)
        shutil.move(file, destDir)

moveFiles()
