helpers do

  def start_session
    session[:user_id] = @user.id
  end

  def password_correct?
    @user.password == @password
  end

  def login
    start_session if password_correct?
  end

end