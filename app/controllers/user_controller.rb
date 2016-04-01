

get '/' do
  erb :"static/index"
end

post '/signup' do
# user = User.new(params[:user])
	@user = User.new(params[:user])
	if @user.save
		session[:current_user_id] = @user.id
		redirect '/home'
	else
		@errors = @user.errors.full_messages
		erb :"static/index"
	end
	
end

post '/login' do


	user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
	if user
		session[:current_user_id] = user.id
		
		redirect '/home'
	else
		
		redirect '/'
	end
end

get '/home' do
	if logged_in?
		@user =  current_user

		erb :"static/home"

	else
		redirect "/"

	end


end

post '/logout' do
	session[:current_user_id] = nil
	redirect '/'
	
end