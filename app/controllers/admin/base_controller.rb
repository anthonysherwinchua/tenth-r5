class Admin::BaseController < ApplicationController

  layout 'admin_lte_2'

  include Pundit

  before_action :authenticate_user!

end
