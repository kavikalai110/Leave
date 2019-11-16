class UserMailer < ApplicationMailer
    default :from => "domian@example.com"
	def sending_mail(leave)
		@leave = leave
		@user = leave.user.email
		@cc = User.where(rolls: true).first.email
    mail(:to => @user, :cc => [@cc],:subject => "Applying Leave")
	end
	def cancel_leave(leave)
    	@leave = leave
    	@user = leave.user.email
		@cc = User.where(rolls: true).first.email
    mail(:to => @user,:cc=>[@cc],:subject => "Cancelling Leave")
	end
end
