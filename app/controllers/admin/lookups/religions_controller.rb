class Admin::Lookups::ReligionsController < Admin::BaseController

  before_action :prepare_new_religion, only: [:new, :create]
  before_action :prepare_religion, only: [:edit, :update]

  def index
    authorize Religion
    @religions = Religion.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @religion.update_attributes(religion_params)
      redirect_to admin_lookups_religions_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @religion.update_attributes(religion_params)
      redirect_to admin_lookups_religions_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_religion
    @religion = Religion.new.tap { |record| authorize record }
  end

  def prepare_religion
    @religion = Religion.find(params[:id]).tap { |record| authorize record }
  end

  def religion_params
    params.require(:religion).permit(:name, :enabled)
  end

end
