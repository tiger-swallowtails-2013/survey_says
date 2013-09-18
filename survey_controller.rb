require "sinatra"
require_relative 'db/config.rb'
require_relative 'models/survey.rb'
require_relative 'models/user.rb'

get "/create_survey_form" do
  erb :create_survey_form
end

post "/create_survey_form" do
  Survey.create(title: params[:survey_title])
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(params)
  if user
    "User '#{user.first_name} #{user.last_name}' successfully created!"
  else
    "Error signing up"
  end
end