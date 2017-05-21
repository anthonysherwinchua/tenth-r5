class Admin::Lookups::LanguagesController < Admin::BaseController

  before_action :prepare_new_language, only: [:new, :create]
  before_action :prepare_language, only: [:edit, :update]

  def index
    authorize Language
    @languages = Language.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @language.update_attributes(language_params)
      redirect_to admin_lookups_languages_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @language.update_attributes(language_params)
      redirect_to admin_lookups_languages_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_language
    @language = Language.new.tap { |record| authorize record }
  end

  def prepare_language
    @language = Language.find(params[:id]).tap { |record| authorize record }
  end

  def language_params
    params.require(:language).permit(:name, :enabled)
  end

end
