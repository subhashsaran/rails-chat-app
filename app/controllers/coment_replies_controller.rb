class ComentRepliesController < ApplicationController
  before_action :set_coment_reply, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @coment_replies = ComentReply.all
    respond_with(@coment_replies)
  end

  def show
    respond_with(@coment_reply)
  end

  def new
    @coment_reply = ComentReply.new
    respond_with(@coment_reply)
  end

  def edit
  end

  def create
    @coment_reply = ComentReply.new(coment_reply_params)
    
    @coment_reply.save
    @article=Article.find(coment_reply_params[:article_id])
     respond_with(@article)
    end

  def update
    @coment_reply.update(coment_reply_params)
    respond_with(@coment_reply)
  end

  def destroy
    @coment_reply.destroy
    respond_with(@coment_reply)
  end

  private
    def set_coment_reply
      @coment_reply = ComentReply.find(params[:id])
    end

    def coment_reply_params
      params.require(:coment_reply).permit(:content, :coment_id,:article_id)
    end
end
