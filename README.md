# Introduction
## Setup Backend

- clone the repository
- cd into the crypto-app-backend directory
- run `npm install`
- create a .env file in the root directory and add the following:
```
  DB_HOST=Your_URL_Or_Localhost
  DB_USER=Your_DB_Username
  DB_PASSWORD=YOur_DB_Password
  DB_NAME=Your_DB_Name
  
  JWT_SECRET=Your_Key
  DES_SECRET_KEY=Your_Key
  AES_SECRET_KEY=Your_Key
```  
you can get random 256-bit WEP keys on this website: https://randomkeygen.com/

- run a mysql server and create a database with the name you specified in the .env file
- import encryptionAndDecryption.sql into your database
- run `node server.js` to start the server

## Setup Frontend
- cd into the crypto-app-frontend directory
- run `npm install`
- create a .env file in the root directory and add the following:
```
REACT_APP_EXPRESSJS_API_URL=http://localhost:5000/cryption
```
- run `npm start` to start the frontend


### Notice: 
Backend only receive requests from ```localhost:3000``` at this moment, if you want to add more urls.
find the part below in server.js and add your url to the origin array.
```javascript
app.use(cors({
    origin: ['http://localhost:3000'],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));
```