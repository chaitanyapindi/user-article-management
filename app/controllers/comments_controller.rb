class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article
  before_action :set_comment, only: [:destroy]
  before_action :authorize_commenter_or_author, only: [:destroy]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.commenter = current_user.username
    if @comment.save
      notify_users(@article, @comment)
      redirect_to article_path(@article), notice: 'Comment was successfully created.'
    else
      redirect_to article_path(@article), alert: 'Failed to create comment.'
    end
  end

  def destroy
    if @comment.destroy
      redirect_to article_path(@article), notice: 'Comment was successfully destroyed.'
    else
      redirect_to article_path(@article), alert: 'Failed to destroy comment.'
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def authorize_commenter_or_author
    unless current_user.username == @comment.commenter || current_user == @article.user
      redirect_to article_path(@article), alert: 'You are not authorized to delete this comment.'
    end
  end

  def comment_params
    params.require(:comment).permit(:body)  # Assuming you don't want to allow users to set the commenter directly
  end

  def notify_users(article, comment)
    author_phone_number = article.user.phone_number
    commenter_phone_number = current_user.phone_number
    article_title = article.title

    if author_phone_number.present?
      SmsNotifier.new(to: author_phone_number, body: "Hey #{article.user.username}! A new comment has been added to your article '#{article_title}' by #{comment.commenter}.").send_sms
    end

    if commenter_phone_number.present? && commenter_phone_number != author_phone_number
      SmsNotifier.new(to: commenter_phone_number, body: "Hey #{comment.commenter}! Your comment has been added to the article '#{article_title}'.").send_sms
    end
  end
end
