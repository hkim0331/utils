#!/usr/bin/env node
// web server のメンテ中などに。
// node がインストールされてないか？
//
// usage:
// $ node hello.js [-p port] [-m message]

port = 3000
message = 'Hello, World!'

const http = require('http')

for(i=2; i<process.argv.length; i++) {
    if (process.argv[i] == '-p') {
        i++
        port = Number(process.argv[i])
    } else if (process.argv[i] == '-m') {
        i++
        message = process.argv[i]
    }
}

http.createServer(function(request, response) {
    response.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
    response.end('<h1>' + message + '</h1>')
    console.log(request.method + ' ' + request.url + ' ' + request.connection.remoteAddress)}).listen(port)

console.log('server started at http://127.0.0.1:' + port)

