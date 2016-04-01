post '/tweet' do
	tweet = Tweet.create(subject: params[:subject])
	tweet[:user_id] = current_user.id
	tweet.save
	@tweets =Tweet.all
	redirect '/home'
end



# delete '/question/:id' do
#   Question.delete(params[:id])
#   redirect to("/")
# end

# put '/question/:id' do
#   @question = Question.find(params[:id])
#   @question.update(params[:question])
#   redirect to("/question/#{params[:id]}")
# end 