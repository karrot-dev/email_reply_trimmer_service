require 'sinatra'
require 'json'
require 'email_reply_trimmer'

configure { 
  set :server, :puma
  set :bind, '0.0.0.0'
}

post '/trim' do
  body = JSON.parse(request.body.read)
  text_trimmed = EmailReplyTrimmer.trim(body["text"])
  content_type :json
  { :trimmed => text_trimmed }.to_json
end