require './Controllers/Command'
require './Controllers/Printer'

require 'yaml'

commands_ctrl = Controllers::Command.new 

Controllers::Printer.wellcome

until commands_ctrl.command == 'exit'

  commands_ctrl.listen

end