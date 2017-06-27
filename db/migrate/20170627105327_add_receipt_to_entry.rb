class AddReceiptToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :receipt, :string
  end
end
