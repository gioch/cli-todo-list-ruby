module Controllers

	require 'yaml'

	class IOController

		def self.user_exists? username, password
			
		end

		def self.create_session username, password
			sessionHash = {id: '111000'}

			File.open('./session.yml', 'w') do |session|
				session.puts sessionHash.to_yaml
			end
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