#!/bin/bash
# Ubuntu Setup Script for Loan Calculator Web Server
# This script installs all required software on a base Ubuntu installation

# Text colors and formatting
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Please run this script as root or with sudo${NC}"
  exit 1
fi

print_header() {
    echo -e "${BLUE}${BOLD}"
    echo "╔═══════════════════════════════════════════════╗"
    echo "║        Ubuntu Setup for Loan Calculator       ║"
    echo "║                                               ║"
    echo "║      This script will install Node.js and     ║"
    echo "║      all required dependencies on Ubuntu      ║"
    echo "╚═══════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_header

# Update package lists
echo -e "${YELLOW}Updating package lists...${NC}"
apt update

# Install curl if not present (needed for Node.js installation)
echo -e "${YELLOW}Installing curl...${NC}"
apt install -y curl

# Install git if not present
echo -e "${YELLOW}Installing git...${NC}"
apt install -y git

# Install Node.js and npm
echo -e "${YELLOW}Setting up Node.js repository...${NC}"
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

echo -e "${YELLOW}Installing Node.js and npm...${NC}"
apt install -y nodejs

# Verify installations
echo -e "${GREEN}Installation completed. Verifying...${NC}"

# Check git
GIT_VERSION=$(git --version)
echo -e "${GREEN}Git installed: ${GIT_VERSION}${NC}"

# Check Node.js
NODE_VERSION=$(node -v)
echo -e "${GREEN}Node.js installed: ${NODE_VERSION}${NC}"

# Check npm
NPM_VERSION=$(npm -v)
echo -e "${GREEN}npm installed: ${NPM_VERSION}${NC}"

# Instructions for next steps
echo -e "${BLUE}${BOLD}Next steps:${NC}"
echo -e "1. Clone the loan calculator repository:"
echo -e "   ${YELLOW}git clone https://github.com/DimitriGeelen/js-loan-calculator.git${NC}"
echo -e "   ${YELLOW}cd js-loan-calculator${NC}"
echo -e ""
echo -e "2. Run the installation script:"
echo -e "   ${YELLOW}chmod +x install.sh${NC}"
echo -e "   ${YELLOW}./install.sh${NC}"
echo -e ""
echo -e "3. Access the loan calculator in your browser at:"
echo -e "   ${YELLOW}http://localhost:8000${NC}"
echo -e ""
echo -e "${GREEN}${BOLD}Setup complete!${NC}"
