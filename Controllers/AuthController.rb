module Controllers

	class AuthController

		def self.check?
			false
		end

		def self.login username, password
			p "#{username} logged in!"
		end

		def self.logout
			p 'user Logged out'
		end
	end

end