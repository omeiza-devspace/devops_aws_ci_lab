var http = require('http')
const os = require('os');

const port = process.env.PORT || 3000;
const hostname = os.hostname();

http.createServer(onRequest).listen(port);
console.log('Server has started');

function onRequest(request, response){
  const host = request.socket.localAddress;
  response.writeHead(200, {'Content-Type': 'text/html'});
  response.write(`Hi there! I'm being served from ${hostname} on ${host}:${port}/`);
  response.end();
}