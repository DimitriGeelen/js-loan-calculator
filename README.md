<h1 align="center">Loan Calculator</h1>
<p align="center">A loan calculator built with JavaScript</p>

## Table of Contents
* [Project Status](#project-status)
* [Features](#features)
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

## Web Server Setup
This application includes a simple web server to serve the loan calculator without modifying the HTML files.

### Prerequisites
- Node.js installed on your system

### Running the Web Server
1. Clone this repository
2. Navigate to the project directory in your terminal
3. Run the server using one of the following methods:

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

4. Open your browser and navigate to:
   - Default: http://localhost:8000
   - Custom port: http://localhost:[PORT]

5. Press Ctrl+C in the terminal to stop the server

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