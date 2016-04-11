class UserMailer < ActionMailer::Base
  default :from => "amitkumarsuroliya@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name}", :subject => "Registered")
  end
end

