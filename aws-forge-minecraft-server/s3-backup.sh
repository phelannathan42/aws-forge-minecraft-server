#!/bin/bash
TIMESTAMP=$(date +%F-%H%M)
aws s3 cp forge-server/world s3://your-bucket-name/backups/world-$TIMESTAMP --recursive
