get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/form' do
  erb :form
end


get '/:test' do
 params[:test]
end

get '/:test/:hi' do
  "#{params[:test]} SPACES #{params[:hi]}"
end
  
get '/:test/:hi/*'  do
  params[:splat]
end

