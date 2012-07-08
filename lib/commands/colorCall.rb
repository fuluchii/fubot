require 'botCommand.rb'
require 'fubot.rb'
require 'color'
require 'readline'

def pushCommand
  callback = Proc.new do |robot,msg|
    while(colormsg = Readline.readline(robot.name+' color>',true))
      if(colormsg == 'quit')
	break
      else
      puts colormsg
      end
    end 
    response = Response.new msg 
  end
  regx = /enter color mode/
  command = BotCommand.new regx,callback
end
