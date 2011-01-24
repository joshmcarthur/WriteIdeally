class AboutController < ApplicationController

  def show
  end

  def contact
    if WriteIdeallyMailer.website_contact(params).deliver
      flash[:notice] = "Thanks for contacting us - we'll get back to you as soon as possible - usually somewhere between 2 and 4 days."
    else
      flash[:alert] = "Sorry, but we couldn't send this through just now - this might be a site-wide problem, so please email us directly at hello@do-good.co.nz so that we can fix it right away."
    end
  end

end

