
const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

// Define the Express endpoint
app.get('/', (req, res) => {
    res.send('Hello! Welcome to the Docker Containerized Web API.');
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

