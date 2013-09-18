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
