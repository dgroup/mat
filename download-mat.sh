#!/usr/bin/env bash
set -e
MAT_DIST=MemoryAnalyzer-1.8.1.20180910-linux.gtk.x86_64.zip
TARGET_FOLDER=mat
wget https://mirrors.dotsrc.org/eclipse//mat/1.8.1/rcp/${MAT_DIST}
rm -rf ${TARGET_FOLDER}
unzip -o ${MAT_DIST}
echo "-XX:+UseConcMarkSweepGC" >> mat/MemoryAnalyzer.ini
echo "-XX:+UseParNewGC" >> mat/MemoryAnalyzer.ini
echo "-XX:+CMSParallelRemarkEnabled" >> mat/MemoryAnalyzer.ini
echo "-XX:+CMSClassUnloadingEnabled" >> mat/MemoryAnalyzer.ini
echo "-XX:+UseCMSInitiatingOccupancyOnly" >> mat/MemoryAnalyzer.ini
