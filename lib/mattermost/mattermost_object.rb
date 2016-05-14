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

    def connected?
      self.class.base_uri
    end

    def self.before_method(*names)
      names.each do |name|
        m = name # public_class_method(name)
        define_method(name) do |*args, &block|
          yield
          m.bind(self).(*args, &block)
        end
      end
    end

  end
end