const express = require('express');
const router = express.Router();

const signup = require('./signup/index');

router.use('/signup', signup);

module.export = router;