module Mattermost
  class MattermostObject #:nodoc: all

    def initialize
    end

    class << self
      def method_missing(method_id, *args) #:nodoc:
        o = self.new
        o.send(method_id, *args)
      rescue HTTParty::UnsupportedURIScheme
        raise "You must set Mattermost.connect before calling #{self.inspect}##{method_id}"
      end
    end

  end
end