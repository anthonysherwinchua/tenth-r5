class Admin::Lookups::SkinTypesController < Admin::BaseController

  before_action :prepare_new_skin_type, only: [:new, :create]
  before_action :prepare_skin_type, only: [:edit, :update]

  def index
    authorize SkinType
    @skin_types = SkinType.all
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @skin_type.update_attributes(skin_type_params)
      redirect_to admin_lookups_skin_types_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @skin_type.update_attributes(skin_type_params)
      redirect_to admin_lookups_skin_types_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_skin_type
    @skin_type = SkinType.new.tap { |record| authorize record }
  end

  def prepare_skin_type
    @skin_type = SkinType.find(params[:id]).tap { |record| authorize record }
  end

  def skin_type_params
    params.require(:skin_type).permit(:name)
  end

end
