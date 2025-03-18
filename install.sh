#!/bin/bash
# Installation script for Loan Calculator Web Server
# This script helps set up and run the loan calculator web server

# Text colors and formatting
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Default port
DEFAULT_PORT=8000

print_header() {
    echo -e "${BLUE}${BOLD}"
    echo "╔═══════════════════════════════════════════════╗"
    echo "║           Loan Calculator Web Server          ║"
    echo "║                Installation Script            ║"
    echo "╚═══════════════════════════════════════════════╝"
    echo -e "${NC}"
}

check_nodejs() {
    echo -e "${YELLOW}Checking for Node.js...${NC}"
    if ! command -v node &> /dev/null; then
        echo -e "${RED}Node.js could not be found!${NC}"
        echo -e "Please install Node.js from https://nodejs.org/"
        exit 1
    fi
    
    NODE_VERSION=$(node -v)
    echo -e "${GREEN}Node.js found: ${NODE_VERSION}${NC}"
}

install_dependencies() {
    echo -e "${YELLOW}Installing npm dependencies...${NC}"
    if [ -f "package.json" ]; then
        npm install
        echo -e "${GREEN}Dependencies installed successfully!${NC}"
    else
        echo -e "${RED}Error: package.json not found!${NC}"
        exit 1
    fi
}

# Function to get local IP address (most common external one)
get_local_ip() {
    # Try to get IP address - different methods for different systems
    if command -v ip &> /dev/null; then
        # For Linux with ip command
        IP=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')
    elif command -v ifconfig &> /dev/null; then
        # For macOS or Linux with ifconfig
        # Get first active non-loopback interface
        INTERFACE=$(ifconfig | grep -B1 "inet " | grep -v "127.0.0.1" | head -n1 | cut -d: -f1)
        IP=$(ifconfig $INTERFACE | grep "inet " | awk '{print $2}')
    else
        # If all fails
        IP="your-ip-address"
    fi
    
    echo $IP
}

start_server() {
    # Check if port parameter is provided
    if [ -z "$1" ]; then
        PORT=$DEFAULT_PORT
    else
        PORT=$1
    fi
    
    echo -e "${YELLOW}Starting the web server on port $PORT...${NC}"
    
    # IP address information will now be shown by the server.js script
    echo -e "${BLUE}Server will display access URLs when it starts${NC}"
    echo -e "${BLUE}Press Ctrl+C to stop the server${NC}"
    
    # Start the server
    node server.js $PORT
}

# Main script execution
print_header
check_nodejs
install_dependencies

# Check if user specified a port
if [ -n "$1" ]; then
    start_server "$1"
else
    echo -e "${YELLOW}No port specified, using default port $DEFAULT_PORT${NC}"
    start_server $DEFAULT_PORT
fi
