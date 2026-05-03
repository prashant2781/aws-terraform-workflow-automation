#!/bin/bash
export TF_PLUGIN_CACHE_DIR=/tmp/tf-plugin-cache
export TF_DATA_DIR=/tmp/tfdata-workflow-automation

mkdir -p "$TF_PLUGIN_CACHE_DIR"
mkdir -p "$TF_DATA_DIR"

echo "Terraform temp environment configured:"
echo "TF_PLUGIN_CACHE_DIR=$TF_PLUGIN_CACHE_DIR"
echo "TF_DATA_DIR=$TF_DATA_DIR"
