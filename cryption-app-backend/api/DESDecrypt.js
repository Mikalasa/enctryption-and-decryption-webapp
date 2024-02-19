const express = require('express');
const router = express.Router();
const CryptoJS = require('crypto-js');
require('dotenv').config();

function desDecrypt(encryptedMessage, key) {
    const bytes  = CryptoJS.DES.decrypt(encryptedMessage, key);
    return bytes.toString(CryptoJS.enc.Utf8);
}
router.post('/DESDecrypt', async (req, res) => {
    const { encryptedMessage } = req.body;
    const key = process.env.DES_SECRET_KEY;
    try {
        const decryptedMessage = desDecrypt(encryptedMessage, key);
        res.json({ decryptedMessage });
    } catch (error) {
        console.error('Error during decryption:', error);
        res.status(500).json({ error: 'Decryption error' });
    }
});

module.exports = router;
