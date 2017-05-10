class Admin::Lookups::ContactTypesController < Admin::BaseController

  before_action :prepare_new_contact_type, only: [:new, :create]
  before_action :prepare_contact_type, only: [:edit, :update]

  def index
    authorize ContactType
    @contact_types = ContactType.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @contact_type.update_attributes(contact_type_params)
      redirect_to admin_lookups_contact_types_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @contact_type.update_attributes(contact_type_params)
      redirect_to admin_lookups_contact_types_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_contact_type
    @contact_type = ContactType.new.tap { |record| authorize record }
  end

  def prepare_contact_type
    @contact_type = ContactType.find(params[:id]).tap { |record| authorize record }
  end

  def contact_type_params
    params.require(:contact_type).permit(:name)
  end

end
