class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.boolean :online
      
      t.timestamps
    end
  end
end
