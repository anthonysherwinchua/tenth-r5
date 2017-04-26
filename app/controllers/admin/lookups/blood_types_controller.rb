class Admin::Lookups::BloodTypesController < Admin::BaseController

  before_action :prepare_new_blood_type, only: [:new, :create]
  before_action :prepare_blood_type, only: [:edit, :update]

  def index
    authorize BloodType
    @blood_types = BloodType.all
  end

  def new
  end

  def create
    if @blood_type.save
      redirect_to :index, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blood_type.save
      redirect_to :index, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_blood_type
    @blood_type = BloodType.new.tap { |record| authorize record }
  end

  def prepare_blood_type
    @blood_type = BloodType.find(params[:id]).tap { |record| authorize record }
  end

end