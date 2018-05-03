class CommentsController < ApplicationController

  def create
    @comment = Comment.new()
    @comment.article_id = @article.id
    @comment
    # @comment.body =
  end

  def index
    @comments = Comment.all
