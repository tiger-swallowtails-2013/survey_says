require 'sinatra/activerecord/rake'
require_relative './app/config'


desc "drop the database"
task "db:drop" do
  rm_f 'db/survey_says.sqlite3'
end

desc "create an irb console with environment loaded"
task "console" do
  exec 'irb -r./survey_controller'
end
