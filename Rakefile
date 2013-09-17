require 'rake'
require 'sqlite3'

desc "create the database"
task "db:create" do
  touch 'survey_says.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'survey_says.sqlite3'
end