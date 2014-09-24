require 'base64'

class Activity < ActiveRecord::Base


	def self.add_mock_data 
		10.times do 
			create(body: some_html)
		end
	end

	def self.extract_files
		puts Activity.count
		a =  FileUtils.mkdir_p 'Foo'

		all.each do |activity|
			activity.extract
			puts "Done"
		end
	end

	def extract
		name = ["A","B","C","D"].sample

		File.open("Foo/#{name}.html", 'w+') do  |file|
			puts body
			file.write body
		end

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