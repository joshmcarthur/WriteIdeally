class WriteIdeallyMailer < ActionMailer::Base
  default :from => "WriteIdeally Postman <postman@writeideally.com>"

  def invite(invitation)
    @invitation = invitation
    mail(
      :to => @invitation[:friends_email],
      :subject => "[WriteIdeally] Invite from #{@invitation[:user].email}")
  end

  def website_contact(parameters)
    @info = {:name => parameters[:name], :email => parameters[:email], :message => parameters[:message]}
    mail(
         :to => SITE_CONTACT_ADDRESS,
         :subject => "[URGENT: WriteIdeally] Website Contact"
    )
  end
end

