require 'spec_helper'

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
    expect(User.last.email).to eq("email@example.com")
  end

  it "Signup post with valid information creates new user" do
    post '/signup', {
      :first_name => "FirstPost",
      :last_name  => "LastPost",
      :password   => "passpost",
      :email      => "post@example.com",
    }

    expect(User.last.email).to eq("post@example.com")
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
    expect(Survey.last.title).to eq("My Unique Survey")
  end

  it "Creates new survey with title on create survey page" do
   post '/create_survey_form', {
      :survey_title => "Check out my new survey!",
    }

    expect(Survey.last.title).to eq("Check out my new survey!")

  end

  it "creates questions for survey" do
    Question.create(:question => "What is your name?")
    expect(Question.last.question).to eq("What is your name?")
  end

  it "makes sure Question is related to Survey" do
    q = Question.create(:question => "What is your name?")
    survey = Survey.create(:title => "New Survey")
    q.survey = survey

    expect(q.survey_id).to eq(survey.id)
  end

  it "accepts and displays the appropriate number of questions" do
      post "/create_survey_form" , {
        :survey_title => "Test Title",
        :question_number => "6"
      }

      expect(Survey.last.title).to eq("Test Title")
  end

end

