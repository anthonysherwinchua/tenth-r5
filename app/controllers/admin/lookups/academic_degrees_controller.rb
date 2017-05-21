class Admin::Lookups::AcademicDegreesController < Admin::BaseController

  before_action :prepare_new_academic_degree, only: [:new, :create]
  before_action :prepare_academic_degree, only: [:edit, :update]

  def index
    authorize AcademicDegree
    @academic_degrees = AcademicDegree.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @academic_degree.update_attributes(academic_degree_params)
      redirect_to admin_lookups_academic_degrees_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @academic_degree.update_attributes(academic_degree_params)
      redirect_to admin_lookups_academic_degrees_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_academic_degree
    @academic_degree = AcademicDegree.new.tap { |record| authorize record }
  end

  def prepare_academic_degree
    @academic_degree = AcademicDegree.find(params[:id]).tap { |record| authorize record }
  end

  def academic_degree_params
    params.require(:academic_degree).permit(:name, :enabled)
  end

end
