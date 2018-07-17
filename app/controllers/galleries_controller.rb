class GalleriesController < ApplicationController
  
  before_action :require_manager_logged_in, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @galleries = Gallery.all.order('created_at DESC').page(params[:page])
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_manager.galleries.build(gallery_params)
    if @gallery.save
      flash[:success] = 'ギャラリーに写真を投稿しました。'
      redirect_to galleries_path
    else
      @galleries = current_manager.galleries.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      flash[:success] = "ギャラリーが更新されました"
      redirect_to galleries_path
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @gallery = current_manager.galleries.find_by(id: params[:id])
    @gallery.destroy
    flash[:success] = "ギャラリーの写真を削除しました"
    redirect_to galleries_path
  end
  
  
  private
  
  def gallery_params
    params.require(:gallery).permit(:name, :image, :comment)
  end
end
