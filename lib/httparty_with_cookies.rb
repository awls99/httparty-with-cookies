require 'httparty'

module HTTParty_with_cookies
#  include HTTParty
  attr :cookies

  def self.included(base)
    base.extend HTTParty
    base.send :include, HTTParty
  end

  #####this way we can support the same http verbs as httparty
  HTTParty::Request::SupportedHTTPMethods.each do | netclass |
    method_sym = netclass.to_s.split('::').last.downcase.to_sym
    define_method method_sym do |uri, options={}, &block|

      base_headers = {'Cookie' => request_cookies}
      if options[:headers]
        options[:headers] = base_headers.merge options[:headers]
      else
        options[:headers] = base_headers
      end
      options[:headers] = options[:headers].delete_if{|k,v| v == {}}
      @last_response = self.class.method( method_sym ).call uri, options, &block
      set_cookies
      return @last_response
    end
  end


  def request_cookies
    URI.unescape( @cookies.to_a.map do |cookie|
      cookie.join('=')
    end.join(';') )
  end
  def set_cookies       #ugly hack to get the correct cookie array from the headers
    headers = nil       #3 years later: uglier meta hack to allow fetching headers from 3xx responses
    begin
      headers = @last_response.headers.instance_variable_get(:@header)
    rescue NoMethodError
      headers = @last_response.instance_variable_get(:@header)
    end

    return unless headers and headers['set-cookie']

    response_cookies = headers['set-cookie']
    return unless response_cookies and !response_cookies.empty?
    response_cookies = [ response_cookies ] if response_cookies.is_a? String
    response_cookies.each do |cookie|
      add_cookies( cookie.split(';')[0] )
    end
  end

  private
    def add_cookies *cookies
      @cookies||= {}
      cookies.each do |cookie|
        key, value = cookie.split '=', 2
        @cookies[ key ] = value
      end
    end
end
