require 'fubotException.rb'
class BotCommand

  attr_reader :regx,
              :callback
  def initialize regx, callback 
    @regx = regx
    @callback = callback   
  end

  def can_response? msg
    msg =~ @regx
  end
  def respond msg,robot
    @callback.call msg,robot
  end
end
