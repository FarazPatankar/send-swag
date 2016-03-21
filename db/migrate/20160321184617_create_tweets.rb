class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :sender
      t.string :receiver
      t.string :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
