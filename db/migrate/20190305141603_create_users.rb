class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :admin
      t.string :remember_digest
      t.boolean :online

      t.timestamps
    end
  end
end
