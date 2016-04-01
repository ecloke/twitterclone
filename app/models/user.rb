class User < ActiveRecord::Base
	has_many :tweets
	
	has_secure_password
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message=> "This email is not in proper format"
	validates_uniqueness_of :email, :message=> "This email has already been registered"
	validates_length_of :password, :within => 6..15, :too_long=> "Your password is too long!", :too_short => "Your password is too short!"
	

	# This is Sinatra! Remember to create a migration!
end
