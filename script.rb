require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'tiny_tds'


#Models

require_relative 'models/user'

#connection = TinyTds::Client.new(host: 'localhost',database: 'mapper')
#puts "Connection Is Active = #{connection.active?}"
#result = connection.execute("select * from users")
#t = connection.execute("insert into xmls (xml) values ('hsfjsdgjhsdjhfgsdjhgfwhgdsvfghsdvfhgsvdhsfjsdgjhsdjhfgsdjhgfwhgdsvfghsdvfhgsvdhsfjsdgjhsdjhfgsdjhgfwhgdsvfghsdvfhgsvdhsfjsdgjhsdjhfgsdjhgfwhgdsvfghsdvfhgsvdhsfjsdgjhsdjhfgsdjhgfwhgdsvfghsdvfhgsvdhsfjsdgjhsdjhfgsdjhgfwhgdsvfghsdvfhgsvd')")
#t.insert
#puts "Total Rows = #{result.count}"
#result.each do |row|
#  puts row
#end


connection = ActiveRecord::Base.establish_connection(
	adapter: "sqlserver",
	host: "172.24.30.49",
	port: "1433",
	database: "mapper",
	mode: "dblib")

puts connection

#puts Xml.all

puts User.all
puts ActiveRecord::Base.connection.tables