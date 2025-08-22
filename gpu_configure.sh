#!/bin/bash

# GPU Control Script
# Usage: ./gpu_control.sh <action> <gpu_id>
# Actions: enable, disable
# GPU ID: numeric identifier for the GPU

# Check if correct number of arguments provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <action> <gpu_id>"
  echo "Actions: enable, disable"
  echo "Example: $0 disable 0"
  exit 1
fi

ACTION=$1
GPU_ID=$2

# Validate action
case "$ACTION" in
"disable")
  echo "Disabling GPU $GPU_ID..."
  nvidia-smi -i $GPU_ID -pm 0
  if [ $? -eq 0 ]; then
    nvidia-smi drain -p $GPU_ID -m 1
    if [ $? -eq 0 ]; then
      echo "GPU $GPU_ID successfully disabled"
    else
      echo "Error: Failed to set drain mode for GPU $GPU_ID"
      exit 1
    fi
  else
    echo "Error: Failed to set persistence mode for GPU $GPU_ID"
    exit 1
  fi
  ;;
"enable")
  echo "Enabling GPU $GPU_ID..."
  nvidia-smi drain -p $GPU_ID -m 0
  nvidia-smi -i $GPU_ID -pm 1
  if [ $? -eq 0 ]; then
    echo "GPU $GPU_ID successfully enabled"
  else
    echo "Error: Failed to enable GPU $GPU_ID"
    exit 1
  fi
  ;;
*)
  echo "Error: Invalid action '$ACTION'"
  echo "Valid actions: enable, disable"
  exit 1
  ;;
esac

echo "Operation completed successfully"
