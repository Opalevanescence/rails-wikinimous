class ArticlesController < ApplicationController
  def index
    # Retreive all articles
    @articles = Article.all
  end

  def new
    # Create new article so you can use form_for in html
    @article = Article.new
  end

  def show
    # Show article with specific id
    @article = Article.find(params[:id])
  end

  def create
    article = Article.new(article_params)
    article.save
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
