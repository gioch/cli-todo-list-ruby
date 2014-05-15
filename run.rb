require './Controllers/CommandController'
require './Controllers/PrinterController'

require 'yaml'

# Main Loop

commands_ctrl = Controllers::CommandController.new 

Controllers::PrinterController.wellcome

until commands_ctrl.command == 'exit'

  commands_ctrl.listen

end