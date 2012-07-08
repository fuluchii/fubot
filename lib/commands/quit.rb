require 'botCommand.rb'
require 'fubot.rb'

def pushCommand
  callback = Proc.new do |robot,msg|
    response = Response.new msg 
  end
  regx = /echo/
  command = BotCommand.new regx,callback
end
