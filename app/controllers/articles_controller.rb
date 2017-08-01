class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :get_magazine, only: [:new, :edit, :create, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
    @articles = @magazine.articles.all
  end

  def show
  end

  def new
    @article = @magazine.articles.new
  end

  def edit
    @article = @magazine.articles.find(params[:id])
  end

  def create
    @article = @magazine.articles.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to magazine_article_path(@magazine, @article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to magazine_article_path(@magazine, @article), notice: 'Article was successfully updated.'
      render :show, status: :ok, location: @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    
    redirect_to magazine_url(@magazine), notice: 'Article was successfully destroyed.'
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def get_magazine
      @magazine = Magazine.find(params[:magazine_id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :author, :magazine_id)
    end
end
