class CongratsMailer < ApplicationMailer
	  default from: 'Yokohama Austalia <competition@yokohama.com>'

  	def congrats_mailer(entry)
		mail(to: entry.email, subject: 'Your Entry Has Been Received')
	end
end
