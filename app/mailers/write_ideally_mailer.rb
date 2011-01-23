class WriteIdeallyMailer < ActionMailer::Base
  default :from => "WriteIdeally Postman <postman@writeideally.com>"

  def invite(invitation)
    @invitation = invitation
    mail(
      :to => @invitation[:friends_email],
      :subject => "[WriteIdeally] Invite from #{@invitation[:user].email}")
  end

end

