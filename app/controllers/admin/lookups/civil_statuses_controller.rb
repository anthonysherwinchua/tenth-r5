class Admin::Lookups::CivilStatusesController < Admin::BaseController

  before_action :prepare_new_civil_status, only: [:new, :create]
  before_action :prepare_civil_status, only: [:edit, :update]

  def index
    authorize CivilStatus
    @civil_statuses = CivilStatus.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @civil_status.update_attributes(civil_status_params)
      redirect_to admin_lookups_civil_statuses_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @civil_status.update_attributes(civil_status_params)
      redirect_to admin_lookups_civil_statuses_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_civil_status
    @civil_status = CivilStatus.new.tap { |record| authorize record }
  end

  def prepare_civil_status
    @civil_status = CivilStatus.find(params[:id]).tap { |record| authorize record }
  end

  def civil_status_params
    params.require(:civil_status).permit(:name, :enabled)
  end

end
