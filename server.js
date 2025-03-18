/**
 * Simple Web Server for Loan Calculator
 * 
 * This script sets up a basic HTTP server to serve the loan calculator
 * application without modifying any of the HTML files.
 * 
 * Usage:
 * 1. Make sure Node.js is installed
 * 2. Run: node server.js
 * 3. Open browser and go to: http://localhost:8000
 * 
 * You can specify a different port by running:
 * node server.js 3000
 */

const http = require('http');
const fs = require('fs');
const path = require('path');
const url = require('url');

// Default port or pass as command line argument
const port = process.argv[2] || 8000;

// MIME types for different file extensions
const mimeTypes = {
    '.html': 'text/html',
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.ico': 'image/x-icon'
};

// Create HTTP server
const server = http.createServer((req, res) => {
    console.log(`${new Date().toISOString()} - ${req.method} ${req.url}`);
    
    // Parse the URL
    let parsedUrl = url.parse(req.url);
    
    // Extract the path from the URL
    let pathname = `.${parsedUrl.pathname}`;
    
    // If path ends with '/', serve index.html
    if (pathname === './') {
        pathname = './index.html';
    }
    
    // Get the file extension
    const ext = path.parse(pathname).ext;
    
    // Read the file from the file system
    fs.readFile(pathname, (err, data) => {
        if (err) {
            // If the file is not found
            if(err.code === 'ENOENT') {
                console.log(`File ${pathname} not found`);
                res.writeHead(404, { 'Content-Type': 'text/html' });
                res.end(`<h1>404 Not Found</h1><p>The requested URL ${pathname} was not found on this server.</p>`);
                return;
            }
            
            // For other errors
            console.error(err);
            res.writeHead(500, { 'Content-Type': 'text/html' });
            res.end(`<h1>500 Internal Server Error</h1><p>Sorry, check with the site admin for error: ${err.code}</p>`);
            return;
        }
        
        // If file is found
        // Get the content type based on the file extension
        const contentType = mimeTypes[ext] || 'application/octet-stream';
        
        // Send the file to the client
        res.writeHead(200, { 'Content-Type': contentType });
        res.end(data);
    });
});

// Start the server
server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
    console.log(`Serving loan calculator application from ${process.cwd()}`);
    console.log('Press Ctrl+C to stop the server');
});
