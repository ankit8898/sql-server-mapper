require 'base64'
require 'securerandom'
class Activity < ActiveRecord::Base

	#scope :grouped_by_activity, -> {all.group_by(&:activity_number)}

	def self.add_mock_data 
		delete_all
		3000.times do 
			create(body: some_html,mime: ['html','doc'].sample)
		end
	end

	def self.extract_files
		all.each do |activ|
			activity.extract
			puts "Done"
		end
	end

	def self.extract_with_group
		grouped = all.group_by(&:mime)
		Parallel.each(grouped,in_processes: 8) do |key,value|
			puts key
			puts value.count
			value.each do |obj|
				obj.extract(folder: key)
			end
		end
	end
	

	def extract(opts = {})
		name = ["A","B","C","D"].sample
		if opts[:folder]
			folder = opts[:folder] 
			FileUtils.mkdir_p(folder) unless File.directory?(folder)
			path = "#{folder}/#{SecureRandom.hex}.#{mime}"
		else
			path = "#{SecureRandom.hex}.#{mime}" 
		end

		File.open(path, 'w+') do  |file|
			file.write body
			puts 'Done!'
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