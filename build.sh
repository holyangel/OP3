#!/bin/bash

##############################

# Defconfig
	dc=HDO_defconfig

# Path to kernel source
	k=/home/holyangel/android/OP3

# Path to clean out
	co=~/android/OP3/out

# Compile Path to out
	o="O=/home/holyangel/android/OP3/out"

# Path to image.gz-dtb
	i=~/android/OP3/out/arch/arm64/boot/Image.gz-dtb

# Kernel zip module path
	zm=~/Downloads/HD-OP3-AK2-O-V3/build/system/lib/modules

# Completed kernel zimage path
	zi=~/Downloads/HD-OP3-AK2-O-V3/build/kernel/Image.gz-dtb
	
# Path to whole kernel zip folders
	zp=~/Downloads/HD-OP3-AK2-O-V3/build/
	
# Path to whole kernel zip folders
	zu=~/Downloads/HD-OP3-AK2-O-V3/Upload/

# Kernel zip Name
	kn=HDK_OP3_AK2_V3.9.zip
##############################

# Cleanup
	echo "	Cleaning up out directory"
	rm -rf "$co"
	echo "	Out directory removed!"

##############################

# Make out
	echo "	Making new out directory"
	mkdir -p "$co"
	echo "	Created new out directory"

##############################

# Establish defconfig
	echo "	Establishing build environment.."
	make "$o" "$dc"

# Start Compile
	echo "	First pass started.."
	make "$o" -j32
	echo "	First pass completed!"
	echo "	"
	echo "	Starting Second Pass.."
	make "$o" -j32
	echo "	Second pass completed!"

##############################

# Copy completed kernel to zip
	echo "	Copying kernel to zip directory"
	cp "$i" "$zi"
#	find . -name "*.ko" -exec cp {} "$zm" \;
	echo "	Copying kernel completed!"
	
##############################

# Zip files for upload

	echo "	Making zip file.."
	cd "$zp"
	zip -r "$kn" *
	echo "	Moving zip to upload directory"
	mv "$kn" "$zu" 
	echo "	Completed build script!"
	echo "	Returning to start.."
	cd "$k"
