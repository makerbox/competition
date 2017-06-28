class CongratsMailer < ApplicationMailer
	  default from: 'competition@yokohama.com'

  	def congrats_mailer(entry)
		mail(to: entry.email, subject: 'your entry has been received')
	end
end
