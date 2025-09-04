const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const userRoutes = require('./routes/user');
const tasksRoutes = require('./routes/tasks');
const payoutRoutes = require('./routes/payout');

const app = express();
app.use(cors());
app.use(express.json());

mongoose.connect('mongodb://localhost:27017/greensky', {useNewUrlParser: true, useUnifiedTopology: true});

app.use('/api/user', userRoutes);
app.use('/api/tasks', tasksRoutes);
app.use('/api/payout', payoutRoutes);

app.listen(3000, () => console.log('Green Sky backend running on port 3000'));