module Rcon
  class CommandSender
    attr_accessor :server, :command
    def initialize(server, command)
      @server = Server.find(server)
      @command = command
    end

    def send!
      Rails.logger.info("Connect to RCON for #{server.name}")
      Rails.logger.info("Running command: #{command}")
    end
  end
end
