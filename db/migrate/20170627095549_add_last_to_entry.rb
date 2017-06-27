class AddLastToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :last_name, :string
  end
end
