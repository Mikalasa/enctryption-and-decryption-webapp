const express = require('express');
const router = express.Router();
const db = require('../db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const secretKey = process.env.JWT_SECRET;

router.post('/signin', async (req, res) => {
    const { username, password } = req.body;

    try {
        const query = 'SELECT * FROM user WHERE username = ?';
        const [results] = await db.query(query, [username]);

        if (results.length === 0) {
            return res.status(401).send('Incorrect username or password');
        }

        const user = results[0];

        if (await bcrypt.compare(password, user.password)) {
            const token = jwt.sign({ userId: user.id }, secretKey, { expiresIn: '1h' });
            res.json({
                token,
                firstName: user.first_name,
                lastName: user.last_name,
                username: user.username,
            });
        } else {
            res.status(401).send('Incorrect username or password');
        }
    } catch (err) {
        console.error(err);
        res.status(500).send('Server error');
    }
});

module.exports = router;
