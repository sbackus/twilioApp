require 'sinatra'
require 'twilio-ruby' 

# put your own credentials here 

 # alternatively, you can preconfigure the client like so
Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end

configure do
	set :twilio_client, Twilio::REST::Client.new
end

get '/' do
  erb :form
end

post '/' do
	@number = params[:number]
	@message = params[:message]
	settings.twilio_client.messages.create(
	  from: "+18454434561",
	  to: @number,
	  body: @message
	)
	erb :message_sent
end


 
