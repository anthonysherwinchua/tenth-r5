class Admin::Lookups::AcademicLevelsController < Admin::BaseController

  before_action :prepare_new_academic_level, only: [:new, :create]
  before_action :prepare_academic_level, only: [:edit, :update]

  def index
    authorize AcademicLevel
    @academic_levels = AcademicLevel.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @academic_level.update_attributes(academic_level_params)
      redirect_to admin_lookups_academic_levels_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @academic_level.update_attributes(academic_level_params)
      redirect_to admin_lookups_academic_levels_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_academic_level
    @academic_level = AcademicLevel.new.tap { |record| authorize record }
  end

  def prepare_academic_level
    @academic_level = AcademicLevel.find(params[:id]).tap { |record| authorize record }
  end

  def academic_level_params
    params.require(:academic_level).permit(:name)
  end

end
