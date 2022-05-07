#!/usr/bin/env node
//
// これだけじゃ足りない。2022-04-28
// http-server 使ったら？

var http   = require('http'),
var server = http.createServer(function(req, resp) {
  resp.end('it works');
});

server.listen(8080);

