class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.date :birthday
      t.string :password_digest
      t.string :role
      t.string :store
      t.attachment :avatar
      t.attachment :passport
      

      t.timestamps null: false
    end
  end
end
