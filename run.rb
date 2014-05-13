require './Controllers/CommandController'
require './Controllers/UserController'
require './Controllers/PrinterController'

require 'yaml'


commandsCtrl = Controllers::CommandController.new 
userCtrl = Controllers::UserController.new

Controllers::PrinterController.wellcome

until commandsCtrl.command == 'exit'

	commandsCtrl.listen

end