get '/myprofile' do
	if logged_in?
	
		@user =  current_user
		@all_users = User.all
		@tweets =Tweet.all
		
		
		@mytweets = Tweet.where(user_id: current_user.id).pluck(:subject)
	
		erb :"static/myprofile"

	else 

		redirect '/'
	end
end

# get '/edit' do
# 	byebug
# 	@tweets =Tweet.all
# 	@tweet = @tweets.find(params[:id])
# 	erb :"static/edit"
# end

# put '/edit/:id' do
#   @tweet = Tweet.find(params[:id])
#   @tweet.update(params[:subject])
#   redirect to "/myprofile"
# end

