#!/usr/bin/env ruby
# coding: utf-8

require 'webrick'
include WEBrick

def usage()
  print <<EOF
usage:
  server [--port port] [--root documentroot] [--bind bind.add.ress]
EOF
  exit(1)
end

port = 2000
root = 'public'
bind = '0.0.0.0'

while (arg = ARGV.shift)
  case arg
  when /--port/
    port = ARGV.shift.to_i
  when /--root/
    root = ARGV.shift
  when /--bind/
    bind = ARGV.shift
  else
    usage()
  end
end

s = HTTPServer.new(Port: port,
                   DocumentRoot: File.join(Dir.pwd, root),
                   Bind: bind)
trap("INT") {s.shutdown}
s.start
