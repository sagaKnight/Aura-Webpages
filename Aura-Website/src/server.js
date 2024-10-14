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
    password: '',
    database: 'AuraProject',
    port: 3306
});

db.connect((err) => {
    if (err) {
        console.error("Issue connecting to database", err);
        return
    }
    console.log('Connected to database');
});

//Post Function 
app.post('/submit-order', (req, res) => {
    const { email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift, productNames, amountPaid } = req.body;
    const sql = `INSERT INTO AuraOrders (email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift, productNames, amountPaid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    db.query(sql, [email, fName, lName, pNumber, address, aptNumber, city, state, country, zip, gift, productNames, amountPaid], (err, result) => {
        if (err) {
            console.error('Error inserting data:', err);
            res.status(500).send('Error submitting the form');
            return;
        }
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

// Get collections for homepage function. Max last 6 by id
app.get('/previous-collections', (req, res) => {
    const sql = `SELECT collectionHeading, thumbnail, collectionName, availableBtn FROM auracollections ORDER BY created_at DESC LIMIT 6`;
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching collections: ", err);
            return res.status(500).json({ error: "Database query failed"})
        }
        res.json(results);
    })
});

app.get('/specific-items/:collection', (req, res) => {
    const collection_name = req.params.collection; 
    const sql = `SELECT * FROM auraitems WHERE collectionName = ?`;

    db.query(sql, [collection_name], (err, results) => {
        if (err) {
            console.error('Error retrieving data:', err);
            res.status(500).json({ error: 'Error retrieving data' });
            return;
        }

        if (results.length === 0) {
            console.log('No data found');
            res.status(404).json({ error: 'No data found' });
            return;
        }
        
        res.json(results);
    });
});

app.get('/specific-collection/:collection', (req, res) => {
    const collection_name = req.params.collection; 
    const sql = `SELECT * FROM auracollections WHERE collectionName = ?`;

    db.query(sql, [collection_name], (err, results) => {
        if (err) {
            console.error('Error retrieving data:', err);
            res.status(500).json({ error: 'Error retrieving data' });
            return;
        }

        if (results.length === 0) {
            console.log('No data found');
            res.status(404).json({ error: 'No data found' });
            return;
        }

        res.json(results);
    });
});

app.get('/orders', (req, res) => {
    const sql = `SELECT * FROM auraorders ORDER BY id DESC`;
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching collections: ", err);
            return res.status(500).json({ error: "Database query failed"})
        }

        res.json(results);
    })
});

app.delete('/orderDelete/:id', async (req, res) => {
    const orderId = req.params.id; 
    try {
      const [result] = await pool.execute('DELETE FROM auraorders WHERE id = ?', [orderId]);
      if (result.affectedRows === 0) {
        return res.status(404).json({ message: 'Order not found' });
      }
      res.status(200).json({ message: 'Order deleted successfully' });
    } catch (error) {
      console.error('Error deleting the order:', error);
      res.status(500).json({ message: 'Error deleting the order', error });
    }
})


app.listen(port);


