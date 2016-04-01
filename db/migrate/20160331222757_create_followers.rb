class CreateFollowers < ActiveRecord::Migration
	def change
		create_table :followers do |t|
			t.integer :user_id
			t.string :follow_user
			t.timestamp
		end
	end
end
