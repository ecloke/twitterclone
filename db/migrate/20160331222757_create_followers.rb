class CreateFollowers < ActiveRecord::Migration
	def change
		create_table :followers do |t|
			t.integer :user_id
			t.string :follow_user
			t.integer :follow_user_id
			t.timestamp
		end
	end
end
