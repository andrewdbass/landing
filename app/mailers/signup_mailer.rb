class SignupMailer < ApplicationMailer
	default from: 'notifications@example.com'
	def welcome_email(signup)
		@signup = signup
		mail(to: @signup.email, subject: 'Thanks for signing up!')
	end
	def status_email(signup)
		@signup = signup
		mail(to: @signup.email, subject: 'Status Update') if @signup
	end
end
