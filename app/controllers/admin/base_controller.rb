class Admin::BaseController < ApplicationController

  layout 'admin_lte_2'

  include Pundit

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized

  private

  def admin_not_authorized
    respond_to do |format|
      format.html do
        if request.xhr?
          render :unauthorized, layout: false
        else
          flash[:alert] = 'You are not authorized to perform this action.'
          redirect_to(request.referer || admin_root_path)
        end
      end

      format.js do
        flash.keep[:alert] = 'You are not authorized to perform this action.'
        render js: "window.location = '#{request.referer || admin_root_path}'"
      end
    end
  end

end
