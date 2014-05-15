require './Controllers/CommandController'
require './Controllers/PrinterController'

require 'yaml'

#this is main file

commands_ctrl = Controllers::CommandController.new 

Controllers::PrinterController.wellcome

until commands_ctrl.command == 'exit'

  commands_ctrl.listen

end