require 'sinatra'

get '/set_cookies' do
  response.set_cookie 'foo', 'bar'
  response.set_cookie 'hello', 'world'
end

get '/get_cookies' do
   if request.cookies['foo'] == 'bar' and request.cookies['hello'] ==  'world'
     '1'
   else
     '0'
   end
end