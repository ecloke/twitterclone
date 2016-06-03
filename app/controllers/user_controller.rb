
enable :sessions
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
		@following = Follower.all
		@user =  current_user
		@tweets =Tweet.all
		erb :"static/home"

	else
		redirect "/"

	end


end

post '/logout' do
	session[:current_user_id] = nil
	redirect '/'
	
end


post '/profile/:username' do
	
	@tweet_user = User.find_by(username: params[:username])
	@tweets = Tweet.all
	@all_users = User.all
	

	erb :"static/profile"
end



delete '/tweet/:id' do
	 @tweets = Tweet.all
  @delete_tweet = Tweet.find_by(id: params[:id])

  Tweet.delete(params[:id])
  redirect '/home'

end


	