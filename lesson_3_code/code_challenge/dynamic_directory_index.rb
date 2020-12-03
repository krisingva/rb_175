require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.glob("public/*").map { |file| File.basename(file) }.sort
  @files.reverse! if params[:sort] == "desc"
  # puts self.methods - Object.instance_methods
  # puts self.params
  erb :home
end