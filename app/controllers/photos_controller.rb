class PhotosController < ApplicationController
  before_action :require_manager_logged_in, only: [:new, :create, :edit, :update, :destroy]
  def index
    @mountain = Mountain.find(params[:mountain_id])
    @photos = Photo.where(mountain_id: @mountain.id).order(created_at: :asc).page(params[:page])
  end
  
  def show
  end
  
  def new
    @mountain = Mountain.find(params[:mountain_id])
    @photo = Photo.new
  end
  
  def create
    @mountain = Mountain.find(params[:mountain_id])
    @photo = Photo.new(photo_params)
    @photo.mountain_id = @mountain.id
    if @photo.save
      flash[:success] = '備忘録に写真を投稿しました。'
      redirect_to mountain_photos_path(@photo.mountain_id)
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @mountain = Mountain.find(params[:mountain_id])
    @photo = Photo.find(params[:id])
  end
  
  def update
    @mountain = Mountain.find(params[:mountain_id])
    @photo = Photo.find(params[:id])
    @photo.mountain_id = @mountain.id
    if @photo.update(photo_params)
      flash[:success] = '写真を更新しました。'
      redirect_to mountain_photos_path(@photo.mountain_id)
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @photo = Photo.find_by(id: params[:id])
    @photo.destroy
    flash[:success] = "ギャラリーの写真を削除しました"
    redirect_to mountain_photos_path(@photo.mountain_id)
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:image, :comment)
  end
  
end
