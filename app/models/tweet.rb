class Tweet < ActiveRecord::Base
	belongs_to :user
	validates_length_of :subject, :within => 1..140, :too_long=> "Your tweet is too long!", :too_short => "Please tweet something"

end
	