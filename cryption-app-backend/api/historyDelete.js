const express = require('express');
const router = express.Router();
const db = require('../db');

router.post('/historyDelete', async (req, res) => {
    const { username, historyType, id } = req.body;

    if (!username || !id) {
        return res.status(400).json({ error: 'Missing username or id.' });
    }

    const validTypes = ['caesar', 'des', 'aes'];
    if (!historyType || !validTypes.includes(historyType)) {
        return res.status(400).json({ error: 'Invalid or missing history type.' });
    }

    try {
        const query = `DELETE FROM ${historyType} WHERE id = ? AND user_id = (SELECT id FROM user WHERE username = ? LIMIT 1)`;
        const [results] = await db.query(query, [id, username]);

        if (results.affectedRows === 0) {
            return res.status(404).json({ error: 'No record found or user not authorized to delete this record.' });
        }

        res.status(200).json({ message: 'Record deleted successfully.' });
    } catch (error) {
        console.error('Error querying the database:', error);
        return res.status(500).json({ error: 'Error querying the database.' });
    }
});

module.exports = router;
