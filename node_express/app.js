const express = require('express')
const app     = express()

app.get('/', (req, res) => {
  res.send('hello world')
})

app.listen(9292, function () {
  console.log('App started!');
});
