class MagazinesController < ApplicationController
  before_action :set_magazine, only: [ :edit, :update, :destroy]
  before_action :check_user, except: [:show, :new, :create, :all_magazines, :index]
  before_action :authenticate_user!,  only: [:new, :edit, :update, :destroy]

  def index
    @magazines = current_user.magazines
  end

  def all_magazines
    @magazines = Magazine.all
  end

  def show
    @magazine = Magazine.find(params[:id])
    @articles = @magazine.articles
  end

  def new
    @magazine = Magazine.new
  end

  def edit
  end

  def create
    @magazine = current_user.magazines.new(magazine_params)

    if @magazine.save
      redirect_to @magazine, notice: 'Magazine was successfully created.'
    else
      render :new
    end
  end

  def update
    if @magazine.update(magazine_params)
      redirect_to @magazine, notice: 'Magazine was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @magazine.destroy
    
    redirect_to magazines_url, notice: 'Magazine was successfully destroyed.'
  end

  private
    def set_magazine
      @magazine = current_user.magazines.find(params[:id])
    end

    def check_user
      @magazine = current_user.magazines.find(params[:id])
      redirect_to magazines_url , notice: "You are not authorized to edit this magazine" if @magazine.user_id != current_user.id
    end

    def magazine_params
      params.require(:magazine).permit(:user_id, :title, :description)
    end
end
