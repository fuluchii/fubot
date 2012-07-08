require 'botCommand.rb'
require 'readline'
require 'fubot.rb'

class BotShell
  attr_reader :robot
  def initialize robot
   @robot = robot 
  end

  def run
    begin
      while(msg = Readline.readline(@robot.name+">",true))
        if msg == 'quit'
	  exit
	end
	response = recieve msg
	puts response.reply
      end
    rescue SignalException => e
      puts "intterupted"
    end
  end


  def stop
   puts 'test' 
  end

  def recieve msg
    @robot.recieve msg
  end

  def send msg
    puts @robot.name+">"+msg
  end
end


