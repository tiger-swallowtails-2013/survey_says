require 'active_record'
require 'rack/test'
require_relative '../survey_controller'

describe 'User Signup' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Creates new user with valid information" do
    User.create(
      :first_name => "First",
      :last_name  => "Last",
      :password   => "password",
      :email      => "email@example.com",
    )
    User.last.email.should == "email@example.com"
  end

  it "Signup post with valid information creates new user" do
    post '/signup', {
      :first_name => "FirstPost",
      :last_name  => "LastPost",
      :password   => "passpost",
      :email      => "post@example.com",
    }

    User.last.email.should == "post@example.com"
  end

  it "User password is a hash" do
    post '/signup', {
      :first_name => "FirstPost",
      :last_name  => "LastPost",
      :password   => "passpost",
      :email      => "post@example.com",
    }

  expect { BCrypt::Password.new(User.last.password) }.to_not raise_error
  BCrypt::Password.new(User.last.password).should == "passpost"
  end



end


describe 'Survey Creation Process' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Creates new survey with title" do
    Survey.create(
      :title => "My Unique Survey",
    )
    Survey.last.title.should == "My Unique Survey"
  end

  it "Creates new survey with title on create survey page" do
   post '/create_survey_form', {
      :survey_title => "Check out my new survey!",
    }

    Survey.last.title.should == "Check out my new survey!"

  end

  it "Create questions for survey" do
    Question.create(
      :question => "What is your name?",
    )
    Question.last.question.should == "What is your name?"
  end

  it "Creates questions for survey on create questions page" do
   post "/surveys/#{Survey.last.id}/questions", {
      :question1 => "Do you have any pets?",
      :question2 => "Do you have any pets?",
      :question3 => "Do you have any pets?",
    }
    Question.last.question.should == "Do you have any pets?"  
  end

  it "Make sure Question is related to Survey" do

    Question.last.survey_id.should == Survey.last.id
  end

end
