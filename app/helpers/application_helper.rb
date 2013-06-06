module ApplicationHelper

  def flash_messages(flash)
    html = ''
    flash.each do |key, msg|
      html << content_tag('div', class: "alert alert-#{key}") do
        content_tag('button', 'x', class: 'close', 'data-dismiss' => 'alert', type: 'button') + msg
      end
    end
    html.html_safe
  end

end
