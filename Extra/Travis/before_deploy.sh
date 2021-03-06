#!/bin/bash

echo ----==== Copying files into other directory ====----

mkdir ../BuildUtils/LIKO-12
cp -v -f -r ./* ../BuildUtils/LIKO-12/
cd ../BuildUtils/LIKO-12/

echo ----==== Removing unnecessary files... ====----

rm -v -f README.md mkdocs.yml .travis.yml .gitattributes .gitignore
rm -v -f -r .git Docs DLL Extra

echo ----==== Packing .love file ====----

7z A -r -y -tzip -bd "../LIKO-12.love" .
cd ..

echo ----==== Building Windows 32bit ====----

cat Windows_x86/love.exe LIKO-12.love > Windows_x86/LIKO-12.exe
rm -v -f Windows_x86/love.exe
7z A -r -y -tzip -bd Builds/LIKO-12_Nightly_Windows.zip Windows_x86/*

echo ----==== Building Linux ====----

cp -v -f -r ../LIKO-12/* ./Linux/
7z A -r -y -tzip -bd Builds/LIKO-12_Nightly_Linux.zip Linux/*

echo ----==== Building OS_X ====----

cp -v -f LIKO-12.love OS_X/LIKO-12.app/Contents/Resources/LIKO-12.love
7z A -r -y -tzip -bd Builds/LIKO-12_Nightly_Mac.zip OS_X/*

echo ----==== Copying Universal... ====----
  
cp -v -f LIKO-12.love Builds/LIKO-12_Nightly_Universal.love

echo ----==== Done ====----

cd ../LIKO-12/