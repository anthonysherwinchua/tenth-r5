class Admin::Lookups::BloodTypesController < Admin::BaseController

  before_action :prepare_new_blood_type, only: [:new, :create]
  before_action :prepare_blood_type, only: [:edit, :update]

  def index
    authorize BloodType
    @blood_types = BloodType.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @blood_type.update_attributes(blood_type_params)
      redirect_to admin_lookups_blood_types_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @blood_type.update_attributes(blood_type_params)
      redirect_to admin_lookups_blood_types_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_blood_type
    @blood_type = BloodType.new.tap { |record| authorize record }
  end

  def prepare_blood_type
    @blood_type = BloodType.find(params[:id]).tap { |record| authorize record }
  end

  def blood_type_params
    params.require(:blood_type).permit(:name)
  end

end
