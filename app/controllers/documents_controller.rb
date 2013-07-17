class DocumentsController < ApplicationController
  respond_to :html
  responders :flash

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.create document_params
    respond_with @document
  end

  def show
    @document = Document.find params[:id]
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:name, :file)
  end

  def interpolation_options
    { resource_name: @document.name }
  end
end
