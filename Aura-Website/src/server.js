import bodyParser from 'body-parser';
import mysql from 'mysql2';
import cors from 'cors';
import express from 'express';

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
        console.error("Issue connecting to database", err);
        return
    }
    console.log('Connected to database');
});

//Post Function 
app.post('/submit-form', (req, res) => {
    const { email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift, productNames } = req.body;
    const sql = `INSERT INTO AuraOrders (email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift, productNames) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    db.query(sql, [email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift, productNames], (err, result) => {
        if (err) {
            console.error('Error inserting data:', err);
            res.status(500).send('Error submitting the form');
            return;
        }
        console.log(req.body);
        res.status(200).send('Form submitted successfully!');
    });
});

//Get Receipt Function. Which puts table into descending order and picks index 0.
app.get('/receipt', (req, res) => {
    const sql = `SELECT * FROM AuraOrders ORDER BY id DESC LIMIT 1`;
    db.query(sql, (err, result) => {
        if (err) {
            console.error('Error retrieving data:', err);
            res.status(500).json({ error: 'Error retrieving data' });
            return;
        }
        console.log(result);
        if (result.length === 0) {
            console.log('No data found');
            res.status(404).json({ error: 'No data found' });
            return;
        }
        const order = result[0];
        order.productNames = JSON.parse(order.productNames);
        res.json(order);
    });
});

// Get all orders function.
app.get('/orders', (req, res) => {
    const sql = `SELECT * FROM AuraOrders ORDER BY id ASC`;
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error retrieving data:', err);
            res.status(500).json({ error: 'Error retrieving data' });
            return;
        }
        console.log(results);
        if (results.length === 0) {
            console.log('No data found');
            res.status(404).json({ error: 'No data found' });
            return;
        }
        results.forEach(order => {
            order.productNames = JSON.parse(order.productNames);
        });
        res.json(results);
    });
});


app.listen(port);


