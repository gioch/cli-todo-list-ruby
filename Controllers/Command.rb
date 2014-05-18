require './Controllers/Auth'
require './Controllers/Printer'
require './Controllers/User'
require './Controllers/Task'

module Controllers

  class Command

    attr_accessor :command 

    def listen

      @command = get_console_input

      case @command
        when 'login' 
          if Auth.check?
            Printer.user_logged
          else
            Printer.login
            Printer.label 'username'
            username = get_console_input
            Printer.label 'password'
            password = get_console_input

            if Auth.login? username, password
              Printer.admin_wellcome
            else
              Printer.invalid_credentials
            end
          end

        when 'create'
          Printer.create_account
          Printer.label 'username'
          username = get_console_input
          Printer.label 'password'
          password = get_console_input

          if User.unique? username
            User.create_user username, password
            if Auth.login? username, password
              Printer.admin_wellcome
            else
              Printer.invalid_credentials
            end
          else
            Printer.not_unique_user
          end

        when 'logout'
          Auth.logout

        when 'tasks'
          Printer.tasks

          user_tasks = User.tasks

          Printer.show_tasks user_tasks

        when 'add'
          Printer.add_task
          Printer.label "Task Title"
          task_title = get_console_input

          Printer.label "days you need to finish?"
          task_estimation_time = get_console_input

          Task.create_new_task task_title, task_estimation_time

        when 'delete'
          Printer.label "Task Id To Delete"
          task_id = get_console_input
          task_id = task_id.to_i

          Task.delete_task task_id
      end
    end

    def get_console_input
      gets.chomp
    end
  end

end