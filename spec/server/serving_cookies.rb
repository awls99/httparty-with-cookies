require 'sinatra'

set_block = lambda do
  response.set_cookie 'foo', 'bar'
  response.set_cookie 'hello', 'world'
end

get_block = lambda do
  if request.cookies['foo'] == 'bar' and request.cookies['hello'] ==  'world'
    '1'
  else
    request.cookies.inspect
  end
end

no_cookie_block = lambda do
  '1'
end

[:get, :post, :delete, :put].each do | method_sym |
  send( method_sym,'/set_cookies', &set_block )
  send( method_sym,'/get_cookies', &get_block )
  send( method_sym,'/no_cookies', &no_cookie_block )
end