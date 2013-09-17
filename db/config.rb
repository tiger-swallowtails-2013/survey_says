require 'sinatra'
require "sinatra/activerecord"

set :database, "sqlite3:///db/survey_says.sqlite3"