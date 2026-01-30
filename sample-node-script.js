const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello from a simple Node.js app!\n");
});

const PORT = 3000;

server.listen(PORT, () => {});
