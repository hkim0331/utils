#!/usr/bin/env ruby
# coding: utf-8
#
# origin: ${utils}/sweep.rb
#
# 2020-09-04: 244 以降で
# /Users/hkim/bin/sweep:56:in `popen': Too many open files -
# /sbin/ping -c 2 -t 1 192.168.0.245 2>/dev/null (Errno::EMFILE)
# のエラーが出る。
# => solved, シンプルに 125 ずつに分ける。
#
# programmed by hkimura, 2016-04-25, 2016-05-01.

require 'socket'

$debug = false

PING = if File.exists?("/sbin/ping")
         "/sbin/ping"
       elsif File.exists?("/bin/ping")
         "/bin/ping"
       else
         raise "not found ping command"
       end

# default macos. linux differs.
INTF= "en0"

def usage(s)
  print <<EOU
#{s}
usage:
 $ #{$0}
 $ #{$0} -i eth0 a.b.c.d-e
 $ #{$0} -i eth0 -c 2 -t 3 10.0.34.1-99

a.b.c.d ... a.b.c.e の IP アドレスに ping を打つ。
ping が返ればその IP を表示する。

引数なしの場合は自分のサブネットに ping を撒き散らす。

-i intf
   インタフェースを指定する。
-c c
   ping の数を整数で（デフォルトは2）。
-t t
    タイムアウトを秒で（デフォルトは1）。
EOU
  exit(1)
end

def get_my_addr(intf)
  Socket.getifaddrs
    .select{ |x| x.name==intf and x.addr.ipv4? }.first.addr.ip_address
rescue
  puts $!
  usage("try using -i option.")
end

def ping?(ip, count, timeout)
  cmd = "#{PING} -c #{count} -t #{timeout} #{ip} 2>/dev/null"
  puts "cmd: #{cmd}" if $debug
  IO.popen(cmd) do |pipe|
    pipe.readlines.each do |line|
      puts line if $debug
      return true if line =~ /(round-trip)|(rtt)/
    end
  end
  return false
end

def pings(mynet, from, to, count, timeout)
  threads = []
  (from..to).each do |ip|
    threads << Thread.new("#{mynet}.#{ip}") do |addr|
      puts addr if ping?(addr, count, timeout)
    end
  end
  threads.each {|thr| thr.join}
end

#
# main
#

if __FILE__ == $0
  intf = INTF
  count = 2
  timeout = 1
  mynet = nil
  from = 1
  to = 254
  while (arg = ARGV.shift)
    case arg
    when /\A-d/
      $debug = true
    when /\A-i/
      intf = ARGV.shift
    when /\A(-h)|(--help)/
      usage("")
    when /\A-c/
      count = ARGV.shift.to_i
    when /\A-t/
      timeout = ARGV.shift.to_i
    when /\A-/
      usage("unknown arguments: #{arg}")
    when /\A(\d+\.\d+.\d+)\.(\d+)-(\d+)\Z/
      mynet = $1
      from = $2.to_i
      to = $3.to_i
    else
      usage("illegal format: #{arg}")
    end
  end

  if mynet.nil?
    mynet = get_my_addr(intf).split(/\./)[0..2].join('.')
    from = 1
    to = 254
  end
  puts "mynet:#{mynet} from:#{from} to:#{to}" if $debug

  # solved: 244 problem. if to-from>200, then sweep twice.
  if (to-from > 200)
    pings(mynet, from, 125, count, timeout)
    pings(mynet, 126, to, count, timeout)
  else
    pings(mynet, from, to, count, timeout)
  end

end
