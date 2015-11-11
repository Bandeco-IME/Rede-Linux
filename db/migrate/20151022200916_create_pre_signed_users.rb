class CreatePreSignedUsers < ActiveRecord::Migration
  def change
    create_table :pre_signed_users do |t|
      t.string :n_usp
      t.string :name
      t.string :login
      t.string :email
      t.string :encrypt_password

      t.timestamps null: false
    end
  end
end
