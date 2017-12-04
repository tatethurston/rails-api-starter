class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :email, unique: true, null: false
      t.text :password_digest, unique: true, null: false
      t.text :token, unique: true, null: false
      t.timestamps
    end
  end
end
