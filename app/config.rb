require 'sinatra'
require "sinatra/activerecord"
require_relative 'models/question'
require_relative 'models/survey'
require_relative 'models/response'
require_relative 'models/user'
require_relative 'survey_controller'

# set :database, "sqlite3///db/survey_says.db"

# ENV['DATABASE_URL'] ||= "postgres://localhost/survey_says_development"
# set :database, ENV['DATABASE_URL']

if settings.test?
	set :database, "sqlite3:///db/survey_says.db"
else
	configure :development  do
		set :database, "sqlite3:///mydb.sqlite3"
	end

	configure :production do
		ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
	end
end