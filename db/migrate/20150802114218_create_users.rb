class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :verification_token
      t.datetime :verified_at
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
