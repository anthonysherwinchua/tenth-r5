class Admin::Lookups::ZodiacsController < Admin::BaseController

  before_action :prepare_new_zodiac, only: [:new, :create]
  before_action :prepare_zodiac, only: [:edit, :update]

  def index
    authorize Zodiac
    @zodiacs = Zodiac.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @zodiac.update_attributes(zodiac_params)
      redirect_to admin_lookups_zodiacs_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @zodiac.update_attributes(zodiac_params)
      redirect_to admin_lookups_zodiacs_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_zodiac
    @zodiac = Zodiac.new.tap { |record| authorize record }
  end

  def prepare_zodiac
    @zodiac = Zodiac.find(params[:id]).tap { |record| authorize record }
  end

  def zodiac_params
    params.require(:zodiac).permit(:name)
  end

end
