class ApplicationController < ActionController::Base

  protect_from_forgery prepend: true, with: :exception

  def after_sign_in_path_for(_resource_or_scope)
    admin_root_path
  end

end
