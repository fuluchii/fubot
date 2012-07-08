require 'botCommand.rb'
require 'fubot.rb'
def pushCommand 
 callback =  Proc.new do |msg,robot| 
   response = Response.new 'test success.' 
 end
 regx = /test/
 command = BotCommand.new regx,callback
end

