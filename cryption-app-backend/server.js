const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors({
    origin: ['http://localhost:3000'],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

const bodyParser = require('body-parser');
const port = 5000;

const signup = require('./api/signup');
const signin = require('./api/signin');
const caesarSave = require('./api/caesarSave');
const history = require('./api/history');
const historyDelete = require('./api/historyDelete');
const DESEncrypt = require('./api/DESEncrypt');
const DESDecrypt = require('./api/DESDecrypt');
const AESEncrypt = require('./api/AESEncrypt');
const AESDecrypt = require('./api/AESDecrypt');
const authenticationToken = require('./authenticationToken');

app.use(bodyParser.json());
app.use('/cryption', signup);
app.use('/cryption', signin);
app.use('/cryption', caesarSave);
app.use('/cryption', history);
app.use('/cryption', historyDelete);
app.use('/cryption', DESEncrypt);
app.use('/cryption', DESDecrypt);
app.use('/cryption', AESEncrypt);
app.use('/cryption', AESDecrypt);





app.listen(port, () => {
    console.log(`Express server listening on http://localhost:${port}`);
});
