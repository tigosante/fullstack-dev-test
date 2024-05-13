#!/bin/bash

CURRENT_DIR=${PWD/\/scripts\/frontend/}

echo "-> Deleting all files in $CURRENT_DIR except frontend directory..."
find $CURRENT_DIR ! -name "frontend" -exec rm -rf {} +

echo "-> Moving all files from frontend directory to $CURRENT_DIR..."
mv $CURRENT_DIR/frontend/* $CURRENT_DIR
