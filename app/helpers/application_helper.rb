module ApplicationHelper
  def clearfix
    output = "<br style='clear: both; margin: 0; padding: 0;' />"
    output.html_safe
  end

  def flashes
    output = ""
    output << "<div class='flash notice'>#{flash[:notice]}</div>\n" if flash[:notice]
    output << "<div class='flash error'>#{flash[:error]}</div>\n" if flash[:error]
    output << "<div class='flash error'>#{flash[:alert]}</div>\n" if flash[:alert]
    output.html_safe
  end

  def idea_statistics
    output = {:number_of_ideas => "Countless", :number_of_users => "Countless"}
    user_count = User.count
    idea_count = Idea.count

    unless idea_count.nil? || idea_count < 5
      output[:number_of_ideas] = idea_count
    end

    unless user_count.nil? || user_count < 5
      output[:number_of_users] = user_count
    end

    return output
  end

  def signature
    output = ""
    output << "<em class='signature'>Josh & Gemma, the WriteIdeally team.</em>\n"
    output << clearfix
    return output.html_safe
  end
end

