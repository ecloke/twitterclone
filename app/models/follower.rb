class Follower < ActiveRecord::Base
	belongs_to :user
	# This is Sinatra! Remember to create a migration!
end
