module ApplicationHelper
  def flash_messages
    ''.tap do |flashes|
      flashes << content_tag(:div, flash.alert, class: 'alert alert-danger') if flash.alert
      flashes << content_tag(:div, flash.notice, class: 'alert alert-info') if flash.notice
    end.html_safe
  end
end
