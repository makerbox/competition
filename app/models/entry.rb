class Entry < ApplicationRecord
	  validates :email, :first_name, :last_name, :address_line_1, :postcode, :phone, :store_name, :receipt_number, :sale_date, presence: true
 
 def self.to_csv
    attributes = %w{id email full_name address_line_1 postcode phone store_name receipt_number sale_date subscribe}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end

end
