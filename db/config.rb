require 'sinatra'
require "sinatra/activerecord"
require 'active_record'

# set :database, "sqlite3///db/survey_says.db"

# ENV['DATABASE_URL'] ||= "postgres://localhost/survey_says_development"
# set :database, ENV['DATABASE_URL']

configure :development, :test do
	set :database, 'sqlite3//development.db'
end

configure :production do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

	ActiveRecord::Base.establish_connection( 
		:adapter => db.scheme == 'postgres' ? 'postgresql' db.scheme,
		:host => db.host,
		:username => db.user,
		:password => db.password,
		:database => db.path[1..-1],
		:encoding => 'utf8'
		)
end