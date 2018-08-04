class ServerDecorator < ApplicationDecorator
  def ports
    "RCON: #{rcon_port}, Game: #{game_port}, Query: #{query_port}"
  end
end
