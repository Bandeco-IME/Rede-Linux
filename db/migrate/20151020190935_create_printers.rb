class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :name
      t.text :status

      t.timestamps null: false
    end
  end
end
