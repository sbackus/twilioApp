require 'sinatra'

get '/' do
  erb :form
end

post '/' do
  "send message..."
end