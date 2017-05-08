class Admin::Lookups::CitizenshipsController < Admin::BaseController

  before_action :prepare_new_citizenship, only: [:new, :create]
  before_action :prepare_citizenship, only: [:edit, :update]

  def index
    authorize Citizenship
    @citizenships = Citizenship.all
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @citizenship.update_attributes(citizenship_params)
      redirect_to admin_lookups_citizenships_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @citizenship.update_attributes(citizenship_params)
      redirect_to admin_lookups_citizenships_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_citizenship
    @citizenship = Citizenship.new.tap { |record| authorize record }
  end

  def prepare_citizenship
    @citizenship = Citizenship.find(params[:id]).tap { |record| authorize record }
  end

  def citizenship_params
    params.require(:citizenship).permit(:name, :enabled)
  end

end
