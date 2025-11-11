import os
import shutil

def build_aero3():
    libPath = "./aero3.c3l"
    srcPath = "./src"
    os.mkdir(libPath)
    print("\x1b[0;32m[INFO]\x1b[0m Making Dependency Diretory")

    shutil.copytree(srcPath, libPath, dirs_exist_ok=True)
    print("\x1b[0;32m[INFO]\x1b[0m Copy files to Dep Path")


if (__name__ == "__main__"):
    build_aero3()