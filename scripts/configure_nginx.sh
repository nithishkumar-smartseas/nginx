#!/bin/bash
set -e

# Get absolute path of this script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Repo root is one level above scripts/
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Script dir: $SCRIPT_DIR"
echo "Repo root: $REPO_ROOT"
echo "Copying nginx.conf to /etc/nginx/"

cp -f "$REPO_ROOT/nginx.conf" /etc/nginx/nginx.conf
