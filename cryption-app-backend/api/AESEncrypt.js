const express = require('express');
const router = express.Router();
const CryptoJS = require('crypto-js');
const db = require('../db');
require('dotenv').config();

function aesEncrypt(message, key) {
    return CryptoJS.AES.encrypt(message, key).toString();
}

router.post('/AESEncrypt', async (req, res) => {
    const { username, message } = req.body;
    const key = process.env.AES_SECRET_KEY;

    try {
        // check if user exists
        const userQuery = 'SELECT id FROM user WHERE username = ? LIMIT 1';
        const [userResults] = await db.query(userQuery, [username]);

        if (userResults.length === 0) {
            return res.status(404).json({ error: 'User not found.' });
        }

        const userId = userResults[0].id;
        const encryptedMessage = aesEncrypt(message, key);

        // add info
        const insertQuery = 'INSERT INTO aes (aes_encrypt_text, user_id) VALUES (?, ?)';
        await db.query(insertQuery, [encryptedMessage, userId]);

        res.json({ encryptedMessage });
    } catch (error) {
        console.error('Error during encryption:', error);
        res.status(500).json({ error: 'Encryption error' });
    }
});

module.exports = router;
