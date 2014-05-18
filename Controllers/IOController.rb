module Controllers

  require 'yaml'

  class IOController

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

    def self.generate_user_id users_array

      new_user_id = rand(99999999) 

      users_array.each do |item|
        if new_user_id == item[:id]
          new_user_id = generate_user_id (users_array)
          break
        end
      end
 
      new_user_id
    end

    def self.create_user user, pass

      users_array = get_all_users  
      
      new_user_id = generate_user_id(users_array)

      new_user_hash = {id: new_user_id, username: user, password: pass }

      users_array.push(new_user_hash)

      File.open('./users.yml', 'w') do |file|
        file.puts users_array.to_yaml
      end
      
    end

    def self.create_session? user, pass
      session_hash = {}
      result = false

      users_array = get_all_users  

      if users_array.any?

        users_array.each do |item|
          if user == item[:username] && pass == item[:password]
            session_hash = {id: item[:id]}
            result = true
            break
          end
        end

        if result 
          File.open('./session.yml', 'w') do |session|
            session.puts session_hash.to_yaml
          end
        end 
      end

      result
    end

    def self.session_exists?
      exists?('./session.yml')
    end

    def self.session_user_id
      if session_exists? 
        session_info = []

        session_info = yaml_load('./session.yml')
 
        session_info[:id]
      else
        -1
      end
    end

    def self.get_tasks
      auth_user_id = session_user_id.to_i
 
      user_tasks = []

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

      all_tasks = get_all_tasks

      new_task_id = generate_task_id all_tasks

      task_hash = { id: new_task_id, user_id: auth_user_id, title: task_title, due_date: estimation }

      all_tasks.push(task_hash)

      File.open('./tasks.yml', 'w') do |tasks|
        tasks.puts all_tasks.to_yaml
      end
      
    end

    def self.generate_task_id tasks_array

      new_task_id = rand(99999999) 

      tasks_array.each do |item|
        if new_task_id == item[:id]
          new_task_id = generate_task_id (tasks_array)
          break
        end
      end
 
      new_task_id
    end

    def self.delete_task task_id
      all_tasks = []
      index = 0
      exists = false

      all_tasks = get_all_tasks

      if all_tasks.any?

        all_tasks.each do |task|
          if task[:id] == task_id
            exists = true
            break
          end
          index += 1
        end

        all_tasks.slice!(index)

        File.open('./tasks.yml', 'w') do |tasks|
          tasks.puts all_tasks.to_yaml
        end
      end
    end

    def self.destroy_session
      File.delete('./session.yml')
    end

    def self.exists? file_path
       File.file?(file_path)
    end

    def self.yaml_load yaml_file_path 
      file_content = [] 
      File.open( yaml_file_path, 'r') do |file|
        file_content = YAML.load(file)
      end 
      file_content
    end

    def self.get_all_users
      users_array = []
      if exists?('./users.yml')
        users_array = yaml_load('./users.yml')
      end
      users_array
    end

    def self.get_all_tasks
      all_tasks = []
      if exists?('./tasks.yml')
        all_tasks = yaml_load('./tasks.yml')
      end
      all_tasks
    end

  end

end