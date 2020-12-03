require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.glob('./public/*').sort
  erb :home
end

get "/descending" do
  @files = Dir.glob('./public/*').sort { |a, b| b <=> a }
  erb :home
end