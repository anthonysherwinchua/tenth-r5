class Admin::Lookups::SchoolsController < Admin::BaseController

  before_action :prepare_new_school, only: [:new, :create]
  before_action :prepare_school, only: [:edit, :update]

  def index
    authorize School
    @schools = School.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @school.update_attributes(school_params)
      redirect_to admin_lookups_schools_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @school.update_attributes(school_params)
      redirect_to admin_lookups_schools_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_school
    @school = School.new.tap { |record| authorize record }
  end

  def prepare_school
    @school = School.find(params[:id]).tap { |record| authorize record }
  end

  def school_params
    params.require(:school).permit(:name, :enabled)
  end

end
