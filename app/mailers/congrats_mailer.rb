class CongratsMailer < ApplicationMailer
	  default from: 'Yokohama Austalia <noreply@iamyokohama.com.au>'

  	def congrats_mailer(entry)
		mail(to: entry.email, subject: 'Your Entry Has Been Received')
	end
end
