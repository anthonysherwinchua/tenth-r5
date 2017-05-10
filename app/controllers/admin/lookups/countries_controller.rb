class Admin::Lookups::CountriesController < Admin::BaseController

  before_action :prepare_new_country, only: [:new, :create]
  before_action :prepare_country, only: [:edit, :update]

  def index
    authorize Country
    @countries = Country.all
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @country.update_attributes(country_params)
      redirect_to admin_lookups_countries_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @country.update_attributes(country_params)
      redirect_to admin_lookups_countries_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_country
    @country = Country.new.tap { |record| authorize record }
  end

  def prepare_country
    @country = Country.find(params[:id]).tap { |record| authorize record }
  end

  def country_params
    params.require(:country).permit(:name, :printable_name, :iso, :iso3, :numcode, :enabled)
  end

end
