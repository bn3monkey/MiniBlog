const express = require('express');

const app = express();

const signupRouter = require('./routes/signup')
const loginRouter = require('./routes/login')
const userRouter = require('./routes/user')

app.use('profile', express.static('profile'))
app.use('/', signupRouter)
app.use('/', loginRouter)
app.use('/', userRouter)


const port = "8080"
const hostname = "127.0.0.1"

app.listen(port ,hostname, ()=>{
    console.log(`Do you know fucking kimchi??`);
});

app.get('/', function(req, res) {
    res.send('Do you know fucking sans?');
  });


