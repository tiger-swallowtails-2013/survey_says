require "sinatra"
require_relative 'db/config.rb'
require_relative 'models/survey.rb'
require_relative 'models/user.rb'
require_relative 'models/question.rb'
require_relative './session_helper.rb'

enable :sessions

get "/create_survey_form" do
  erb :create_survey_form
end

post "/create_survey_form" do
  survey = Survey.create(title: params[:survey_title])
  @survey_title = params[:survey_title]
  @question_number = params[:question_number]
  redirect "/surveys/#{survey.id}/#{@survey_title}/#{@question_number}/questions/new"
end

get "/surveys/:survey_id/:survey_title/:question_number/questions/new" do
  @survey_title = params[:survey_title]
  @question_number = params[:question_number]
  @survey_id = params[:survey_id]
  erb :create_survey_questions
end

post "/surveys/:survey_id/questions" do
  survey = Survey.find(params[:survey_id])

  question1 = Question.create(question: params[:question1]) 
  question2 = Question.create(question: params[:question2]) 
  question3 = Question.create(question: params[:question3])
  
  question1.survey = survey
  question1.save
  question2.survey = survey
  question2.save
  question3.survey = survey
  question3.save
  erb :success
end

# get "/success" do
#   erb :create_survey_questions
# end

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

get '/login' do
  erb :login
end

post '/login' do
  login(params[:email], params[:password])
  if logged_in?
    redirect '/create_survey_form'
  else
    redirect '/signup'
  end
end

