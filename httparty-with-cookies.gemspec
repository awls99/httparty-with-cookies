SPEC = Gem::Specification.new do |s|
  s.name         = "httparty_with_cookies"
  s.version      = "1.0.0"
  s.date         = Time.now.strftime("%Y-%m-%d")
  s.author       = "Arthur Silva"
  s.summary      = "Basic automatic cookie handling for HTTParty"
  s.description  = "This gem works mostly as HTTParty, but has automatic saving and sending of cookies to the server."
  s.add_dependency 'httparty'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'sinatra'
  s.files        = Dir.glob("{lib}/*").push __FILE__
  s.require_path = "lib"
  s.has_rdoc = false
end
