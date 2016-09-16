class Entry < ApplicationRecord
	  validates :email, :full_name, :address_line_1, :postcode, :phone, :store_name, :terminal_number, :receipt_number, :sale_date, :sale_time, :birth_year, presence: true
 
 def self.to_csv
    attributes = %w{id email full_name address_line_1 postcode phone store_name terminal_number receipt_number sale_date sale_time birth_year subscribe}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end

end
