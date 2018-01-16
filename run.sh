#!/bin/bash

##############################

# Defconfig
	dc=hd2_defconfig

# Path to kernel source
	k=/home/holyangel/android/OP3

# Path to clean out
	co=~/android/OP3/out

# Compile Path to out
	o="O=/home/holyangel/android/OP3/out"

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
	make "$o" -j64
	echo "	First pass completed!"
	echo "	"
