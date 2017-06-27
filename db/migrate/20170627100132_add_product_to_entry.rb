class AddProductToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :product, :string
  end
end
