class Admin::Lookups::OccupationsController < Admin::BaseController

  before_action :prepare_new_occupation, only: [:new, :create]
  before_action :prepare_occupation, only: [:edit, :update]

  def index
    authorize Occupation
    @occupations = Occupation.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @occupation.update_attributes(occupation_params)
      redirect_to admin_lookups_occupations_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @occupation.update_attributes(occupation_params)
      redirect_to admin_lookups_occupations_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_occupation
    @occupation = Occupation.new.tap { |record| authorize record }
  end

  def prepare_occupation
    @occupation = Occupation.find(params[:id]).tap { |record| authorize record }
  end

  def occupation_params
    params.require(:occupation).permit(:name, :enabled, :shorthand)
  end

end
