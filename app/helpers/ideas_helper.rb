module IdeasHelper

  def edit_idea(idea)
    return link_to t('ideas.list.edit'), edit_idea_path(idea), :class => 'edit-link'
  end

  def idea_tags(idea)
    tags = idea.tags_from(current_user).join(',').blank? ? "" : idea.tags_from(current_user).join(',')
    output = link_to t('ideas.list.tags'),
      "##{dom_id(idea, :line)}",
      :class => 'tags-link show_if_js',
      :title => tags

    output.html_safe
  end

  def delete_idea(idea)
    return link_to t('ideas.list.delete'), delete_idea_path(idea), :confirm => t('ideas.deleted.warning'), :method => :delete, :remote => true, :class => 'delete-link'
  end

  def edit_title_on_click_tag(form, idea)
    output = "<div>\n"
    output << "<span id='#{dom_id(idea, :title)}' class='no-input'>\n"
    output << "#{h(idea.title)}\n"
    output << "</span>\n"
    output << "<span id='#{dom_id(idea, :trigger_feedback)}' class='change-title-trigger'>#{t('ideas.edit.title_change_trigger.disabled')}</span>\n"
    output << "</div>\n"
    output << "<script type='text/javascript'>\n"
    output << "$(document).ready(function() {\n"
    output << "$('##{dom_id(idea, :trigger_feedback)}').toggle(function() {\n"
    output << "title_container = $('##{dom_id(idea, :title)}');\n"
    output << "$('##{dom_id(idea, :trigger_feedback)}').html('#{t('ideas.edit.title_change_trigger.enabled')}');\n"
    output << "input_field = $('#{form.text_field(:title)}');\n"
    output << "title_container.html('');input_field.appendTo(title_container);\n"
    output << "input_field.focus();\n"
    output << "title_container.removeClass('no-input');\n"
    output << "title_container.addClass('input');\n"
    output << ";},\n"
    output << "function() {\n"
    output << "title_container = $('##{dom_id(idea, :title)}');\n"
    output << "$('##{dom_id(idea, :trigger_feedback)}').html('#{t('ideas.edit.title_change_trigger.disabled')}');\n"
    output << "title_container.html('#{h(idea.title)}')\n"
    output << "title_container.removeClass('input');\n"
    output << "title_container.addClass('no-input');});\n"
    output << "});\n"
    output << "</script>\n"
    output.html_safe
  end
end

