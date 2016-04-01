class CreateTweets < ActiveRecord::Migration
	def change
		create_table :tweets do |t|
			t.string :subject 
			t.integer :user_id
			
			t.timestamp 
		end
	end
end
