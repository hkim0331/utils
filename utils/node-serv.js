var http   = require('http'),
var server = http.createServer(function(req, resp) {
  resp.end('it works');
});

server.listen(8080);

