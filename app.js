const express = require('express');
const bodyparser = require('body-parser');
const cors = require('cors');

const app = express();

app.use(bodyparser);
app.use(cors);


const routes = require('.\routers');

app.use('/api', routes);

