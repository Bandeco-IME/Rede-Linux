class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :name
      t.text :status
      t.string :url
      t.string :error_url
      
      t.timestamps null: false
    end
  end
end
