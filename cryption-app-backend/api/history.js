const express = require('express');
const router = express.Router();
const db = require('../db');

router.get('/history', async (req, res) => {
    const { username, historyType } = req.query;

    if (!username) {
        return res.status(400).json({ error: 'Missing username.' });
    }

    const validTypes = ['caesar', 'des', 'aes'];
    if (!historyType || !validTypes.includes(historyType)) {
        return res.status(400).json({ error: 'Invalid or missing history type.' });
    }

    try {
        const query = `SELECT * FROM ${historyType} WHERE user_id = (SELECT id FROM user WHERE username = ? LIMIT 1)`;
        const [results] = await db.query(query, [username]);

        res.status(200).json(results);
    } catch (error) {
        console.error('Error querying the database:', error);
        res.status(500).json({ error: 'Error querying the database.' });
    }
});

module.exports = router;
