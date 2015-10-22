class CreatePreSignedUsers < ActiveRecord::Migration
  def change
    create_table :pre_signed_users do |t|
      t.string :nid
      t.string :login
      t.string :email
      t.text :password

      t.timestamps null: false
    end
  end
end
