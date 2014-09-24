class SqlServerMapper
	
	def self.connect!
		begin 
			ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
			ActiveRecord::Base.establish_connection(:development)
			if ActiveRecord::Base.connection.active?
				puts 'DB is connected, Yay!'
			end
		rescue Exception => e 
			puts "Exception DB connection: #{e.message}"
			raise 'DB connection Failed!' 
		end
	end
end