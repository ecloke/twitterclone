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

get '/myprofile/edit' do

	erb :"static/edit"

end
