class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = if params[:tag_id]
                  Tag.find(params[:tag_id]).articles
                else
                  Article.all
                end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
    flash[:notice] = "Article successfully created"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash[:notice] = "Article successfully deleted"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash[:notice] = "Article successfully updated"
    redirect_to article_path(@article)
  end


end
