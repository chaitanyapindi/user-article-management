class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize_author, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end
  
  def edit
  end

  def create
    if !(user_signed_in?) # if current_user.nil?
      redirect_to new_user_session_path, alert: 'You must be logged in to create an article.'
      return
    end
    
    @article = current_user.articles.build(article_params)

    if @article.save
      SmsNotifier.new(to: current_user.phone_number, body: "Hey #{current_user.username} ! A new article with '#{@article.title}' title is created.").send_sms
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      SmsNotifier.new(to: current_user.phone_number, body: "Hey #{current_user.username} ! An article with '#{@article.title}' title is updated.").send_sms
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy

    if @article.destroy
      SmsNotifier.new(to: current_user.phone_number, body: "Hey #{current_user.username}! The article '#{params[:title]}' was successfully deleted.").send_sms
      redirect_to articles_path, notice: 'Article was successfully destroyed.'
    else
      redirect_to articles_path, alert: 'Failed to destroy article.'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def authorize_author
    unless @article.user == current_user
      redirect_to articles_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
