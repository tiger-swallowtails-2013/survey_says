require "sinatra"
require_relative 'db/config.rb'
require_relative 'models/survey.rb'

get "/create_survey_form" do
  erb :create_survey_form
end

post "/create_survey_form" do
  Survey.create(title: params[:survey_title])
  redirect '/'
end

