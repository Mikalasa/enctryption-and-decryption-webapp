const express = require('express');
const router = express.Router();
const db = require('../db');
const bcrypt = require('bcrypt');

const saltRounds = 10;

router.post('/signup', async (req, res) => {
    const { username, firstName, lastName, password } = req.body;

    try {
        const checkUserExistQuery = 'SELECT * FROM user WHERE username = ? LIMIT 1';
        const [userResults] = await db.query(checkUserExistQuery, [username]);

        if (userResults.length > 0) {
            return res.status(409).send('Username already exists');
        } else {
            const hashedPassword = await bcrypt.hash(password, saltRounds);

            const insertQuery = `
                INSERT INTO user (username, password, first_name, last_name)
                VALUES (?, ?, ?, ?);
            `;
            await db.query(insertQuery, [username, hashedPassword, firstName, lastName]);

            res.status(200).send('User registered successfully');
        }
    } catch (err) {
        console.error('Error:', err);
        res.status(500).send('Error while processing your request');
    }
});

module.exports = router;
