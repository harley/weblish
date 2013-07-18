class DocumentsController < ApplicationController
  before_filter :authenticate_user!, except: :show

  respond_to :html
  responders :flash

  def index
    @documents = current_user.documents
  end

  def new
    @document = current_user.documents.build
  end

  def edit
    @document = current_user.documents.find params[:id]
  end

  def update
    @document = current_user.documents.find params[:id]
    @document.update_attributes document_params
    respond_with @document
  end

  def create
    @document = current_user.documents.create document_params
    respond_with @document
  end

  def show
    @document = Document.find params[:id]
    @commentable = @document
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:name, :file, topic_ids: [])
  end

  def interpolation_options
    { resource_name: @document.name }
  end
end
