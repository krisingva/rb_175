request_line = "GET /?rolls=2&sides=6 HTTP/1.1"
arr = request_line.split
# p arr
# arr = ["GET", "/?rolls=2&sides=6", "HTTP/1.1"]
# p arr[0] == "GET"
# p arr[1] == "/?rolls=2&sides=6"
# p arr[2] == "HTTP/1.1"
http_method = arr[0] #"GET"
path, parameters = arr[1].split("?")
# p http_method
# p path
# p parameters
# http_method == "GET"
# path == "/"
# parameters = "rolls=2&sides=6"
param_arr = parameters.split("&")
p param_arr
# param_arr = ["rolls=2", "sides=6"]
params = {}
param_arr.each do |pair|
  new_pair = pair.split("=")
  params[new_pair[0]] = new_pair[1]
end
p params
# params == { "rolls" => "2", "sides" => "6" }
