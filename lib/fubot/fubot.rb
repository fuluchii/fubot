require 'fubotException.rb'
require 'botCommand.rb'
require 'response.rb'
require 'botShell.rb'

include MyException
class Fubot
attr_reader :name,
            :commands,
            :masterName,
            :age,
            :gender,
	    :root,
	    :options,
            :shell

def initialize name='Fuluchii' ,options={}
  @name = name
  @commands = []
  @options = options
  puts 'fubot start...'
end 

def loadCommand filePath
  if File.exists? filePath
    require filePath
    begin 
      command = pushCommand
    rescue MyException::NoCorrectFunction => ex
      puts(ex.msg)
    end
   @commands << command 
  end
end

def say something
  @shell.send something
end

#load all the commands in /commands .
#check if a /commands folder in fubot's root path.
#if no,raise an error and show errorMsg.
def start
  @root = @options.delete(:rootPath)
  unless File.directory?(File.join(@root,'commands'))
    raise MyException::InitError,'Init Failed.Check if the commands folder exists.Root is'+File.join(@root,'commands')
  end 
  rememberCommands
  puts 'Fubot '+@name +' starts successfully.'
rescue InitError => ex
  puts ex
  exit
end

#run the shell
def run
  @shell = BotShell.new self
  @shell.run 
end


def recieve msg
  @commands.each do |c|
    if c.can_response? msg  
      response = c.respond self,msg
      return response
    end
  end
  response = Response.new 'sorry,no such command.'
end

#this method help fubot import  all commands 
def rememberCommands
  regx = /\.rb$/
  commandPath = File.join(@root,'commands')
  Dir.foreach(commandPath) do |filename|
   if (filename =~ regx) 
     loadCommand File.join(commandPath,filename)
     puts '['+filename+'] loaded.'
   end
  end
end

end
