get '/myprofile' do
	if logged_in?
	
		@user =  current_user
		@all_users = User.all
		@tweets =Tweet.all

		
		@mytweets = Tweet.where(user_id: current_user.id) #where gives u a collection of tweet entries, find_by return u the first one only
		# @mytweets = Tweet.where(user_id: current_user.id).pluck(:subject) 
	
		erb :"static/myprofile"

	else 

		redirect '/'
	end
end

put '/edit/:id' do
	
	@tweets =Tweet.all
	
	 @edit_tweet = Tweet.find(params[:id])
	 @edit_tweet.update(subject: params[:edit])
	
	erb :"static/home"
end

# put '/tweet/edit/:id' do

# 	@tweets =Tweet.all
# 	@edit_tweet = Tweet.find_by(id: params[:id])
#   @tweet.update(params[:subject])
#   erb  :"static/edit"
# end

