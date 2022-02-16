// web server のメンテ中などに。
// node がインストールされてないか？
// 
// usage:
// % node hello.js
//
// FIXME: port を引数で取れないか？

const http = require('http')
port = 3000

http.createServer(function(request, response) {
    response.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
    response.end('<h1>Hello, world!</h1>')
    console.log(request.method + ' ' + request.url + ' ' + request.connection.remoteAddress)}).listen(port)

console.log('server started at http://127.0.0.1:' + port)

