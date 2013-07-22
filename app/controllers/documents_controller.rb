class DocumentsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :like]

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
    @comment = Comment.new
  end

  def destroy
  end

  def like
    if current_user
      @document = Document.find params[:id]
      if params[:vote] == 'like'
        @document.liked_by current_user
      elsif params[:vote] == 'unlike'
        # somehow unliked_by doesn't work
        @document.disliked_by current_user
      end
    else
      flash[:error] = "Sorry. You need to be signed in to like a document"
    end

    respond_to do |fmt|
      fmt.js
    end
  end

  def explore
    @documents = Document.order("created_at DESC").page(params[:page]).per(20)
  end

  private

  def document_params
    params.require(:document).permit(:name, :file, topic_ids: [])
  end

  def interpolation_options
    { resource_name: @document.name }
  end
end
