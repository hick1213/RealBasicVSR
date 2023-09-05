!/bin/sh

read -p "Enter the output video file name: " output_file

ffmpeg -f concat -i merge_list.txt -c copy $output_file.mp4
