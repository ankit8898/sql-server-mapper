class Activity < ActiveRecord::Base


	def self.add_mock_data 
		10.times do 
			create(body: some_html)
		end
	end

	def extract
		puts "Hoooo"
	end


	def self.some_html
		"<!DOCTYPE html>
		<html>
		<body>

		<h1 style='color:blue'>This is a heading</h1>

		<p style='color:green;margin-left:20px'>This is a paragraph.</p>

		</body>
		</html>
		"
	end
end