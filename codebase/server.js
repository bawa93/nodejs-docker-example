const express = require('express')

const app = express()

app.get('/', (req, res) => {
  res.send('Docker is amazing!')
})

app.listen(3000, () => console.log('Server listening @ 3000'))