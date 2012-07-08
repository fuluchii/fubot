require 'fubot.rb'
require 'botShell.rb'
options ={}
options[:rootPath] = '/home/fuluchii/fubot/lib'
robot = Fubot.new 'Fuluchii',options
robot.start
robot.run
