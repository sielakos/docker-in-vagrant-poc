const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;
const randNr = Math.round(Math.random() * 100000000);

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end(`Hello World randNr = ${randNr}`);
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});