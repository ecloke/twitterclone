post '/user/:current_user_id/follow' do

	if Follower.find_by(user_id: current_user.id) == nil
		@follower = Follower.new(user_id: params[:current_user_id], follow_user: params[:like])

		@follower.save
	
		
	else
		@message = "You already followed this user"
		
	end
		@follower = Follower.all
		@user =  current_user
		@tweets = Tweet.all
		@all_users = User.all

		erb :"static/home"
end
