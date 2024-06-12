import express from 'express';
import bodyParser from 'body-parser';
import mysql from 'mysql2';
import cors from 'cors';

const app = express();
const port = 3000;

// Express using body-parser module and cors
app.use(bodyParser.json());
app.use(cors());

// Connection to Database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'AuraProject'
});

db.connect((err) => {
    if (err) {
        console.error("Connection Error", err);
        return
    }
    console.log('Connected to database');
});

// Post function
app.post('/submit-form', (req, res) => {
    const { email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift } = req.body;
    const sql = `INSERT INTO AuraOrders (email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`; // Updated SQL query
    db.query(sql, [email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift], (err, result) => {
        if (err) {
            console.error('Error inserting data:', err);
            res.status(500).send('Error submitting the form');
            return;
        }
        console.log('Form submitted successfully!');
        res.status(200).send('Form submitted successfully!');
    });
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});


