class Admin::Lookups::DocumentsController < Admin::BaseController

  before_action :prepare_new_document, only: [:new, :create]
  before_action :prepare_document, only: [:edit, :update]

  def index
    authorize Document
    @documents = Document.all
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @document.update_attributes(document_params)
      redirect_to admin_lookups_documents_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @document.update_attributes(document_params)
      redirect_to admin_lookups_documents_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_document
    @document = Document.new.tap { |record| authorize record }
  end

  def prepare_document
    @document = Document.find(params[:id]).tap { |record| authorize record }
  end

  def document_params
    params.require(:document).permit(:name, :enabled)
  end

end
