class Entry < ApplicationRecord
	  validates :email, :full_name, :address_line_1, :address_line_2, :postcode, :phone, :store_name, :terminal_number, :receipt_number, :sale_date, :sale_time, :birth_year, presence: true
 
end
