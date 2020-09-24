const express = require('express')

const app = express()

app.get('/', (req, res) => {
  res.send('Docker is amazing55555!')
})

app.listen(3000, () => console.log('Server listening @ 3000'))