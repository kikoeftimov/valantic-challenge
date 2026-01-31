from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = 8080

class HelloHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(b"Hello from a simple Python app!\n")

server = HTTPServer(("0.0.0.0", PORT), HelloHandler)
server.serve_forever()
