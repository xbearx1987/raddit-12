class LinksController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_link_and_check_permission , only: [:edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user

    if @link.save
      redirect_to links_path
    else
      render :news
    end
  end

  def edit
  end

  def update
    @link.update(link_params)
    if @link.save
      redirect_to links_path
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_path
  end

private
  def find_link_and_check_permission
    @link = Link.find(params[:id])

    if @link.user != current_user
      redirect_to root_path
    end
  end

  def link_params
    params.require(:link).permit(:title,:url)
  end

end
