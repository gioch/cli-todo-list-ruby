module Controllers

	require 'yaml'

	class IOController

		def self.user_exists? user
			users_array = []  
			result = true

			File.open('./users.yml', 'r') do |file|
				users_array = YAML.load(file)
			end

			users_array.each do |item|

				if item[:username] == user
					result = false
					return
				end
			end

			result
		end

		def self.generate_user_id users_array

			new_user_id = rand(9999999) 

			users_array.each do |item|
				if new_user_id == item[:id]
					new_user_id = generate_user_id (users_array)
					break
				end
			end
 
			new_user_id
		end

		def self.create_user user, pass
			users_array = [] 

			File.open('./users.yml', 'r') do |file|
				users_array = YAML.load(file)
			end

			new_user_id = generate_user_id(users_array)

			new_user_hash = {id: new_user_id, username: user, password: pass }

			users_array.push(new_user_hash)

			File.open('./users.yml', 'w') do |file|
				file.puts users_array.to_yaml
			end
		end

		def self.create_session? user, pass
			session_hash = {}
			users_array = []
			result = false

			File.open('./users.yml', 'r') do |file|
				users_array = YAML.load(file)
			end

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

			result
		end

		def self.session_exists?
			File.file?('./session.yml')
		end

		def self.session_user_id
			if session_exists? 
				session_info = {}
				File.open('./session.yml', 'r') do |session|
					session_info = YAML.load(session)
				end
				session_info[:id]
			else
				-1
			end
		end

		def self.destroy_session
			File.delete('./session.yml')
		end

	end

end