const express = require('express');
const app = express();

const port = process.env.HELLO_PORT || 3000;

app.get('/', (req, res) => res.send('Hello World from beluga demo app!'));

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
