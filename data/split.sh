#!/bin/bash

# Get input file name from user input
read -p "Enter the input video file name: " input_file

# Create output directory if it doesn't exist
mkdir -p splits

# Split the input video into segments
ffmpeg -i "$input_file" -c:v copy -c:a copy -f segment -segment_time 5 -reset_timestamps 1 "splits/output_%04d.mp4"

#find splits -maxdepth 1 -type f -name "output_*.mp4" | sort | sed "s/^/file '/;s/$/'/" > merge_list.txt

