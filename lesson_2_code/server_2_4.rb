require 'socket'

def parse_request(request_line)
  http_method, path_parameters, http_version = request_line.split
  path, parameters = path_parameters.split("?")

  params = parameters.split("&").each_with_object({}) do |pair, hash|
    new_pair = pair.split("=")
    hash[new_pair[0]] = new_pair[1]
  end

  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK\r\n\r\n"
  client.puts request_line
  client.puts "The request method was: #{http_method}"
  client.puts "The request path was: #{path}"
  client.puts "The request parameters were: #{params}"

  params["rolls"].to_i.times do
    client.puts rand(params["sides"].to_i) + 1
  end
  client.close
end
