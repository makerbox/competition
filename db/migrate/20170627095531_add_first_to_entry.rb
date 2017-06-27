class AddFirstToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :first_name, :string
  end
end
