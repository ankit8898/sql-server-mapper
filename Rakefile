require 'rubygems'
require 'bundler/setup'
require 'active_record'


#lib

require_relative 'lib/sql_server_mapper'

SqlServerMapper.connect!

require_relative 'models/activity'

task default: %w[extract_files]


task :extract_files do
  Activity.add_mock_data
end