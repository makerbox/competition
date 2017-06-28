class CongratsMailer < ApplicationMailer
	  default from: 'competition@yokohamae.com'
  		layout 'congrats_mailer'

  	def congrats(entry)
		mail(to: entry.email, subject: 'your entry has been received')
	end
end
