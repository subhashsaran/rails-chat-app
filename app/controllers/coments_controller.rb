class ComentsController < ApplicationController
  before_action :set_coment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @coments = Coment.all
    respond_with(@coments)
  end

  def show
    respond_with(@coment)
  end

  def new
    @coment = Coment.new
    respond_with(@coment)
  end

  def edit
  end

  def create
    @coment = Coment.new(coment_params)
    @coment.save
     puts coment_params[:article_id]
     @article=Article.find(coment_params[:article_id])
     respond_with(@article)
     #render json: @article
  end

  def update
    @coment.update(coment_params)
    respond_with(@coment)
  end



  def destroy
    @coment.destroy
    respond_with(@coment)
  end

  private
    def set_coment
      @coment = Coment.find(params[:id])
    end

    def coment_params
      params.require(:coment).permit(:content, :article_id)
    end
end
