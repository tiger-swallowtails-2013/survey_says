require 'sinatra/activerecord/rake'
require_relative './db/config'


desc "drop the database"
task "db:drop" do
  rm_f 'db/survey_says.sqlite3'
end