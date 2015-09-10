require 'pusher'
class ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    pusher = Pusher::Client.new app_id: '138921', key: '38bff877bf818a065f37', secret: 'aac05e2d62f834ed5dcf'
     pusher.trigger('notifications', 'new_notification', {
        message: 'hii all'
    })
#    pusher = Pusher::Client.new app_id: '138921', key: '38bff877bf818a065f37', secret: 'aac05e2d62f834ed5dcf'

# # trigger on my_channel' an event called 'my_event' with this payload:

# pusher.trigger('my_channel', 'my_event', {
#     message: 'hello world'
# })
  end

  def show
    @conversations = Coment.involving(@article)
    @new_comment = Coment.new
    @new_reply = ComentReply.new
    end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

def create
    @article = Article.new(article_params)
    @article.save
    respond_with(@article)
  end

  def make_comment
    @coment = Coment.new(coment_params)
    @coment.save
    respond_with(@coment)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:body, :author)
    end
end
