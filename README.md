<h1 align="center">Loan Calculator</h1>
<p align="center">A loan calculator built with JavaScript</p>

## Table of Contents
* [Project Status](#project-status)
* [Features](#features)
* [System Requirements](#system-requirements)
* [Ubuntu Setup](#ubuntu-setup)
* [Web Server Setup](#web-server-setup)
* [Installation Scripts](#installation-scripts)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Inspirations](#inspirations)
* [Contact](#contact)
* [License](#license)

## Project Status
This project is currently: _Complete_

## Features
Complete:
* Users can enter a loan amount, interest rate, and years to repay
* Loading animation displays upon submission
* Calculates and displays the results for monthly payment, total payment, and total interest
* An error message displays if the input is invalid
* Simple web server to serve the application
* Installation scripts for Linux/Mac and Windows
* Ubuntu setup script for fresh installations

## System Requirements
* Node.js (v12 or higher)
* npm (comes with Node.js)
* Git (for cloning the repository)

## Ubuntu Setup
For users with a fresh Ubuntu installation, we provide a setup script that installs all the required software:

```bash
# Download the setup script
wget https://raw.githubusercontent.com/DimitriGeelen/js-loan-calculator/master/setup_ubuntu.sh

# Make it executable
chmod +x setup_ubuntu.sh

# Run it with sudo
sudo ./setup_ubuntu.sh
```

This script will:
1. Update your system package lists
2. Install curl and git
3. Install Node.js and npm
4. Verify the installations
5. Provide instructions for next steps

After running the script, you can proceed with cloning the repository and running the web server as described below.

## Web Server Setup
This application includes a simple web server to serve the loan calculator without modifying the HTML files.

### Running the Web Server
1. Clone this repository
```bash
git clone https://github.com/DimitriGeelen/js-loan-calculator.git
cd js-loan-calculator
```

2. Run the server using one of the following methods:

```bash
# Method 1: Using Node directly (default port 8000)
node server.js

# Method 2: Using Node with custom port
node server.js 3000

# Method 3: Using npm scripts
npm install  # Only needed first time
npm start    # Runs on port 8000

# Method 4: Using npm dev script (runs on port 3000)
npm run dev
```

3. Open your browser and navigate to:
   - Default: http://localhost:8000
   - Custom port: http://localhost:[PORT]

4. Press Ctrl+C in the terminal to stop the server

## Installation Scripts
The repository includes installation scripts for both Unix-based systems (Linux/Mac) and Windows to make the setup process easier.

### For Linux/Mac Users
```bash
# Make the script executable
chmod +x install.sh

# Run with default port (8000)
./install.sh

# Or specify a custom port
./install.sh 3000
```

### For Windows Users
```cmd
# Run with default port (8000)
install.bat

# Or specify a custom port
install.bat 3000
```

These scripts will:
1. Check if Node.js is installed
2. Install the required dependencies
3. Start the web server on the specified port

## Screenshots
![Screenshot of Loan Calculator](./images/loan-calc.png)

![Screenshot of Loading Animation](./images/loan-calc-load.png)

![Screenshot of Displaying Results](./images/loan-calc-res.png)

![Screenshot of Error Message](./images/loan-calc-error.png)

## Technologies
Built with:
* HTML
* CSS
* JavaScript
* Node.js (for web server)

## Inspirations
This project was built as part of Brad Traversy's Udemy course, [Modern JavaScript from the Beginning](https://www.udemy.com/modern-javascript-from-the-beginning/).

## Contact
Twitter - [@CBStanley12](https://twitter.com/CBStanley12)

DEV - [cbstanley12](https://dev.to/cbstanley12)

## License
**MIT License**: 
A short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.