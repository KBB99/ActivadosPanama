class CreateJoinTableMessagesUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :messages, :users do |t|
      t.index [:message_id, :user_id]
      t.index [:user_id, :message_id]
    end
  end
end
