class Admin::UsersController < Admin::BaseController

  before_action :prepare_new_user, only: [:new, :create]
  before_action :prepare_user, only: [:edit, :update]

  def index
    authorize User
    @users = User.all
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_user
    @user = User.new.tap { |record| authorize record }
  end

  def prepare_user
    @user = User.find(params[:id]).tap { |record| authorize record }
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :middle_name, :last_name, :password, :password_confirmation)
  end

end
