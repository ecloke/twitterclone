post '/follow/:user_id' do

	if Follower.find_by(user_id: current_user.id) == nil

		@following = Follower.new(follow_user_id: params[:user_id], user_id: current_user.id, follow_user: params[:like])

		@following.save
	
		
	else
		@message = "You already followed this user"
		
	end
		@following = Follower.all
		@user =  current_user
		@tweets = Tweet.all
		@all_users = User.all

		@num_follwers = Follower.where(follow_user: "Follow").count
		erb :"static/home"
end
