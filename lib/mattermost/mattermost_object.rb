module Mattermost
  class MattermostObject #:nodoc: all

    def initialize
    end

    # Return an object that matches a given attribute.
    # Return nil if no matches
    def self.find_by(opts = {})
      all.select { |obj| obj.send(opts.keys.first) == opts.values.first }.first
    end

    # Return the user that has an id of @param id
    def self.find(id)
      find_by(:id => id)
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