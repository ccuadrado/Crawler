class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :username
      t.integer :followers
      t.string :location

      t.timestamps
    end
  end
end
