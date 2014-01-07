require 'unirest'

module Difbot
  class Base
  	class << self
  	  def analyse(type, url, options = {})
  	  	options[:token] = Difbot.config.token unless options.has_key?(:token)
  	  	options[:url] = url
  	  	response = Unirest::get "http://api.diffbot.com/v2/#{type}", 
  					parameters: options
  		response.body
  	  end
  	end
  end
end