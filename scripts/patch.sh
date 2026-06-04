#!/bin/sh

for file in patches/*; do 
    git apply $file
done