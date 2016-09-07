class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :email
      t.string :full_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :postcode
      t.string :phone
      t.string :store_name
      t.string :terminal_number
      t.string :receipt_number
      t.date :sale_date
      t.time :sale_time
      t.string :birth_year
      t.boolean :subscribe

      t.timestamps
    end
  end
end
