#!/usr/bin/env bash

set -e

# Setting Colors
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' #No Color
NOW=$(date "+%Y-%m-%d_%H-%M-%S")


echo -e "${BLUE}Erasing cached videos data...${NC}"
rm -Rf /app/videos/*
echo

echo -e "${BLUE}Done.${NC}"