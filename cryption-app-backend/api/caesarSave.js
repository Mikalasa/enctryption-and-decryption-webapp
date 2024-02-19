const express = require('express');
const router = express.Router();
const db = require('../db');

router.post('/caesarSave', async (req, res) => {
    const { username, encryptedMessage, encryptionStep } = req.body;
    const {request} = req.body

    if (request === "get all orders") {

        res.json()
    }

    if (!username || !encryptedMessage || encryptionStep == null) {
        return res.status(400).json({ error: 'Missing data for encrypted message.' });
    }

    try {
        // check row
        const countQuery = 'SELECT COUNT(*) AS row_count FROM caesar';
        const [countResults] = await db.query(countQuery);

        if (countResults[0].row_count >= 100) {
            return res.status(400).json({ error: 'The table has reached its limit of 100 rows.' });
        }

        // find user
        const userQuery = 'SELECT id FROM user WHERE username = ? LIMIT 1';
        const [userResults] = await db.query(userQuery, [username]);

        if (userResults.length === 0) {
            return res.status(404).json({ error: 'User not found.' });
        }

        // save info
        const userId = userResults[0].id;
        const encryptQuery = 'INSERT INTO caesar (user_id, caesar_content, step, time) VALUES (?, ?, ?, CURRENT_TIMESTAMP)';
        await db.query(encryptQuery, [userId, encryptedMessage, encryptionStep]);

        res.status(200).json({ message: 'Encrypted message saved successfully.' });
    } catch (error) {
        console.error('Error during operation:', error);
        res.status(500).json({ error: 'Error processing your request' });
    }
});

module.exports = router;
