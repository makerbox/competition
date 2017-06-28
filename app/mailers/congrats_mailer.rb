class CongratsMailer < ApplicationMailer
	  default from: 'competition@yokohama.com'

  	def congrats_mailer(entry)
  		@termslink = terms_index_path
		mail(to: entry.email, subject: 'your entry has been received')
	end
end
