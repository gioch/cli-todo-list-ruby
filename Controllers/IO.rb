module Controllers

  require 'yaml'

  class IO

    USER_YAML_FILE = './users.yml'
    SESSION_YAML_FILE = './session.yml'
    TASK_YAML_FILE = './tasks.yml'

    def self.user_exists? user

      result = true

      users_array = get_all_users

      if users_array.any?
 
        users_array.each do |item|

          if item[:username] == user
            result = false
            return
          end

        end
      end

      result
    end

    def self.create_user user, pass
      new_user_id = generate_user_id
      new_user_hash = {id: new_user_id, username: user, password: pass } 
      save_user new_user_hash
    end

    def self.create_session? user, pass
      result = false
      users_array = get_all_users  
      if users_array.any?
        users_array.each do |item|
          if user == item[:username] && pass == item[:password]
            yaml_write( SESSION_YAML_FILE, {id: item[:id]})
            result = true
            break
          end
        end
      end
      result
    end

    def self.session_exists?
      exists?( SESSION_YAML_FILE )
    end

    def self.session_user_id
      if session_exists? 
        session_info = get_session
        session_info[:id]
      else
        -1
      end
    end

    def self.get_tasks
      user_tasks = []
      auth_user_id = session_user_id.to_i
      all_tasks = get_all_tasks
      if all_tasks.any?
        all_tasks.each do |task|
          if task[:user_id] == auth_user_id
            user_tasks.push(task)
          end
        end
      end
      user_tasks
    end

    def self.new_task task_title, estimation
      auth_user_id = session_user_id
      new_task_id = generate_task_id
      task_hash = { id: new_task_id, user_id: auth_user_id, title: task_title, due_date: estimation }
      save_task task_hash  
    end

    def self.save_element file, array, new_data
      array.push(new_data)
      yaml_write( file, array )
    end

    def self.save_user new_user_hash
      users_array = get_all_users 
      save_element USER_YAML_FILE, users_array, new_user_hash
    end

    def self.save_task new_task_hash 
      all_tasks = get_all_tasks
      save_element TASK_YAML_FILE, all_tasks, new_task_hash
    end

    def self.generate_task_id
      generate_unique_id get_all_tasks 
    end

    def self.generate_user_id
      generate_unique_id get_all_users  
    end

    def self.generate_unique_id data
      new_id = rand(99999999) 

      data.each do |item|
        if new_id == item[:id]
          new_id = generate_unique_id (data)
          break
        end
      end
      new_id
    end

    def self.delete_task task_id
      all_tasks = get_all_tasks

      if all_tasks.any?
        index = 0
        all_tasks.each do |task|
          if task[:id] == task_id
            delete_task_from_file all_tasks, index
            break
          end
          index += 1
        end
      end
    end

    def self.delete_task_from_file task_array, index
      task_array.slice!(index)
      yaml_write( TASK_YAML_FILE, task_array)
    end

    def self.destroy_session
      File.delete( SESSION_YAML_FILE )
    end

    def self.exists? file_path
      File.file?(file_path)
    end

    def self.get_session
      yaml_load( SESSION_YAML_FILE )
    end

    def self.get_all_users
      yaml_load( USER_YAML_FILE )
    end

    def self.get_all_tasks
      yaml_load( TASK_YAML_FILE )
    end

    def self.yaml_load yaml_file_path 
      file_content = [] 
      if exists? (yaml_file_path)
        File.open( yaml_file_path, 'r') do |file|
          file_content = YAML.load(file)
        end
      end 
      file_content
    end

    def self.yaml_write yaml_file_path, data
      File.open( yaml_file_path, 'w' ) do |file|
        file.puts data.to_yaml
      end
    end

  end

end