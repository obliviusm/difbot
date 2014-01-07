require_relative "difbot/version"
require_relative "difbot/base"
module Difbot
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
  end

  class Configuration
    attr_accessor :token
  end
=begin
  class << self
  	attr_accessor :first_name

      def myfunction
      	p 	
        Difbot.first_name = "Nathan"
      end
  end
=end
end


token = "55b926c2d517a686c705a3846534f87a"
type = "article"
url = "http://korrespondent.net/ukraine/politics/3282899-mnoho-chesty-myd-otkazalsia-reahyrovat-na-vyskazyvanyia-zadornova-o-evrokhokhlakh"

Difbot.configure do |config|
  config.token = token
end
p Difbot.config.token
p Difbot::Base.analyse(type, url)