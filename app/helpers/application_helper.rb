module ApplicationHelper
  def br(str)
    return if str.blank?
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, "<br />").html_safe
  end
end
