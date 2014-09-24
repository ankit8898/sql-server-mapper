require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'logger'

#lib

require_relative 'lib/sql_server_mapper'

#Models
require_relative 'models/user'

SqlServerMapper.connect!

puts User.all
puts ActiveRecord::Base.connection.tables