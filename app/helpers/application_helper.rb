module ApplicationHelper
  def is_admin? 
    session[:admin].present?
  end
  def current_user
    session[:admin]
  end
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
end
