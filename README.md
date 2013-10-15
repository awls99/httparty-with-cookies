#HTTParty with cookies
=====================
[![Gem Version](https://badge.fury.io/rb/httparty_with_cookies.png)](http://badge.fury.io/rb/httparty_with_cookies)

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

##Limitations
Currently this gem will read all the cookies the server returns save it on your class' instance and for any next request it will send the cookies back - pays no attention to domain or expiration information.

**This works as a module providing instance methods to a class and not as module with class methods as HTTParty!**

Like most open source, I've made this because it solves my problem, and perhaps other people's with similar problems, feel free to add if it's not enough for you :)

##Development
On spec/server there's a very small sinatra sever with cookie setting page, cookie reading page and a no cookies at all page, made to support get, post, delete and put methods, you'll need to fire this server up before running the spec tests.
I cheated a little bit on the spec, don't hate me.
