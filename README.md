#HTTParty with cookies
=====================

This gem allows you to use HTTParty with auto cookie management.

*Cookies returned in the responses will be saved and automatically sent in the next requests!*

Getting started:

    "gem install httparty_with_cookies"

 Then you'll need a class to use it:

    require 'httparty_with_cookies'

    class My_awesome_cookie_using_api
        include HTTParty_with_cookies
    end

    api = My_awesome_cookie_using_api.new
    api.get 'http://someurl.com/endpoint'
    api.cookies['darkside'] #=> 'We have cookies!'


If you're familiar with HTTParty. then the rest of the gem's usage will be simple to you, since this gem is basically handling saving and send the cookies in HTTParty.
If you don't know HTTParty, you can read about it [here](https://github.com/jnunemaker/httparty "Makes http fun again!"), this gem just making using cookies with it brainless and painless.