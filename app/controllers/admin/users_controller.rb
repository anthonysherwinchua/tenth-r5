class Admin::UsersController < Admin::BaseController

  before_action :prepare_new_user, only: [:new, :create]
  before_action :prepare_user, only: [:edit, :update, :lock, :unlock]

  def index
    authorize User
    @users = User.order(email: :asc)
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

  def lock
    render action: :lock, layout: false and return if request.xhr? == 0
    render action: :lock and return if request.get?
    @user.lock_access! send_instructions: false
    redirect_to admin_users_path, notice: 'Successfully locked record.'
  end

  def unlock
    render action: :unlock, layout: false and return if request.xhr? == 0
    render action: :unlock and return if request.get?
    @user.unlock_access!
    redirect_to admin_users_path, notice: 'Successfully unlocked record.'
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
