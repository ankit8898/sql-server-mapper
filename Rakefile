require 'rubygems'
require 'bundler'

Bundler.require(:default)
#require 'active_record'
#require 'require_all'
#require 'parallel'
require_all 'models'
require_all 'lib'

task default: %w[extract_files]


task :extract_files do
  Activity.extract_files
end

SqlServerMapper.connect!