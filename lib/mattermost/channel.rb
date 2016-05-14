module Mattermost
  class Channel < MattermostObject

    def self.new(attributes = {})
      ::Channel.new(attributes)
    end

    # Returns all channels for the current team
    #
    # @param force_refresh [boolean] to recache the channels
    def self.all(force_refresh = false)
      @channels = nil if force_refresh
      @channels ||= all_channels
    end

    # Returns "more" channels for the current team
    def self.more
      Mattermost.get("/channels/more")
    end

    # Returns a hash of counts for each *team*
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
      request = Mattermost.get("/channels/")
      request.parsed_response['channels'].each do |channel|
        channels << self.new(channel)
      end
      channels
    end

  end
end
