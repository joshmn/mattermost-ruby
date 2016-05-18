module Mattermost
  class Channel < MattermostObject

    def self.new(attributes = {})
      if attributes.empty?
        return ::Channel.default_attributes
      end
      ::Channel.new(attributes)
    end

    # Returns channels for the current team _that the logged in user has joined_
    # call Mattermost::Channel.more to get a list of all the channels (like, actually)
    #
    # @param force_refresh [boolean] to recache the channels
    def self.all(force_refresh = false)
      @channels = nil if force_refresh
      @channels ||= all_channels
    end

    # Returns all of the channels for the current team
    # Unlike self.all which only returns the channels the user has joined
    def self.more
      channels = []
      request = Mattermost.get("/teams/#{Mattermost.team.id}/channels/more")
      request.parsed_response['channels'].each do |channel|
        channels << self.new(channel)
      end
      return channels
    end

    # Returns a hash of counts
    # This is mostly useless because fetching a channel will return the counts for you.
    # {"counts"=>{"ps6kdfuk9p8mjx6pkr3krgq3by"=>58334, "yckjbepc4frbmmq9in6tap1dwa"=>32},
    #  "update_times"=>{"ps6kdfuk9p8mjx6pkr3krgq3by"=>1463180151709, "yckjbepc4frbmmq9in6tap1dwa"=>1457216806189}}
    def self.counts
      Mattermost.get("/channels/counts")
    end

    def self.create_direct(attributes = {})
      raise NotImplementedError
      Mattermost.post("/channels/create_direct")
    end

    protected
    def self.all_channels
      channels = []
      request = Mattermost.get("/teams/#{Mattermost.team.id}/channels/")
      request.parsed_response['channels'].each do |channel|
        channels << self.new(channel)
      end
      return channels
    end

  end
end
