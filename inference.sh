#!/bin/bash

# Convert files from splits to results directory
for input_file in data/splits/*; do
    output_file="results/$(basename "$input_file")"
    python3 inference_realbasicvsr.py configs/realbasicvsr_x4.py checkpoints/RealBasicVSR_x4.pth "$input_file" "$output_file" --max_seq_len 1
done

# Generate merge_list.txt with sorted files
find results -maxdepth 1 -type f -name "output_*.mp4" | sort | sed "s/^/file '/;s/$/'/" > merge_list.txt

# Create output directory for merged video
mkdir -p merged

# Merge the videos using concat protocol
ffmpeg -f concat -safe 0 -i merge_list.txt -c copy "merged/merged_output.mp4"

echo "Conversion and merge completed."

