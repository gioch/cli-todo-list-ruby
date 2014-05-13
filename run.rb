require './Controllers/CommandController'
require './Controllers/UserController'
require './Controllers/PrinterController'

commandsCtrl = Controllers::CommandController.new
printerCtrl = Controllers::PrinterController.new
userCtrl = Controllers::UserController.new

printerCtrl.wellcome

until commandsCtrl.command == 'exit'

	commandsCtrl.listen

end