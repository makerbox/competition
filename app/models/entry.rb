class Entry < ApplicationRecord
	  validates :email, :first_name, :last_name, :address_line_1, :postcode, :phone, :store_name, :receipt_number, :sale_date, :product, :receipt, presence: true
 # attr_accessible :receipt

mount_uploader :receipt, ReceiptUploader

 def self.to_csv
    attributes = %w{id email first_name last_name address_line_1 postcode phone store_name receipt_number sale_date product receipt subscribe}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end

end
