#!/bin/bash

# Loop through each pool directory
for pool_dir in Pool*; do
  # Define the paths for the ini file and dcc files
  ini_file=$(ls $pool_dir/*.ini)
  dcc_files=($pool_dir/*_DCC/*.dcc)

  # Check if DSP count in the ini file matches the number of DCC files
  dsp_count=$(grep -c DSP "$ini_file")
  dcc_count=$(ls -1 $pool_dir/*_DCC/*.dcc | wc -l)

  # Print result of the comparison
  if [ "$dsp_count" -eq "$dcc_count" ]; then
    echo "$pool_dir: DSP count matches DCC file count ($dsp_count)"
  else
    echo "$pool_dir: DSP count ($dsp_count) does not match DCC file count ($dcc_count)"
  fi

  # Get the smallest DCC file size
  smallest_file=$(ls -S $pool_dir/*_DCC/*.dcc | tail -1)
  smallest_size=$(stat -c%s "$smallest_file")

  # Print the smallest file size
  echo "$pool_dir: Smallest DCC file is $smallest_file with size $smallest_size bytes"
done

