#!/bin/bash

cd /root/server

if [ -d "build" ]
then
    echo "Directory 'build' already exists, moving to it"
	cd build
else
    mkdir "build" && cd build
	cmake ..
fi

make -j$(nproc) || exit 1
if [ $? -eq 1 ] 
then
	echo "Compilation failed!"
else        
	echo "Compilation successful!"
	cd ..
	mv ./tfs ./tfs.old
	cp ./build/tfs ./tfs
fi
