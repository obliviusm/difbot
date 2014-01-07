require_relative "difbot/version"
require 'unirest'

module Difbot
	class << self
		attr_accessor :config

		def analyse(type, url, options = {})
			options[:token] = Difbot.config.token unless options.has_key?(:token)
			options[:url] = url
			response = Unirest::get "http://api.diffbot.com/v2/#{type}", parameters: options
			response.body
		end
	end

	def self.configure
		self.config ||= Configuration.new
		yield(config)
	end

	class Configuration
		attr_accessor :token
	end
end

=begin
#data:
token = "55b926c2d517a686c705a3846534f87a"
type = "article"
url = "http://korrespondent.net/ukraine/politics/3282899-mnoho-chesty-myd-otkazalsia-reahyrovat-na-vyskazyvanyia-zadornova-o-evrokhokhlakh"

#with config:
Difbot.configure do |config|
  config.token = token
end
p Difbot.config.token
p Difbot.analyse(type, url)

#without config, with options: 
options = Hash.new
options[:token] = token
options[:fields] = "meta,querystring,images(url,pixelHeight)"
p Difbot.analyse(type, url, options)
=end