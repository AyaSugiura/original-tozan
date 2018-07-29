class MountainsController < ApplicationController
  before_action :require_manager_logged_in, only: [:index, :new, :create, :edit, :update, :destroy]
  
  def index
    @mountains = Mountain.all.order("created_at DESC").page(params[:page])
  end
  
  def show
    @mountain = Mountain.find(params[:id])
    @photos = Photo.where(mountain_id: @mountain.id)
  end
  
  def new
    @mountain = Mountain.new
  end
  
  def create
    @mountain = current_manager.mountains.build(mountain_params)
    if @mountain.save
      flash[:success] = '登山備忘録を投稿しました。'
      redirect_to mountains_path
    else
      @mountains = current_manager.mountains.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @mountain = Mountain.find(params[:id])
  end
  
  def update
    @mountain = Mountain.find(params[:id])
    if @mountain.update(mountain_params) && params[:mountain][:route]
      @mountain.route = nil
      @mountain.update(mountain_params)
      flash[:success] = "登山備忘録が更新されました"
      redirect_to mountains_path
    elsif @mountain.update(mountain_params)
      flash[:success] = "登山備忘録が更新されました"
      redirect_to mountains_path
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @mountain = current_manager.mountains.find_by(id: params[:id])
    @mountain.destroy
    flash[:success] = "備忘録を削除しました"
    redirect_to mountains_path
  end
  
  def owari
    @mountains_owari = Mountain.where(area: 1).order("created_at DESC").page(params[:page])
  end
  
  def nishimikawa
    @mountains_nishimikawa = Mountain.where(area: 2).order("created_at DESC").page(params[:page])
  end
  
  def okumikawa
    @mountains_okumikawa = Mountain.where(area: 3).order("created_at DESC").page(params[:page])
  end
  
  def higashimikawa
    @mountains_higashimikawa = Mountain.where(area: 4).order("created_at DESC").page(params[:page])
  end
  
  def china
    @mountains_china = Mountain.where(area: 5).order("created_at DESC").page(params[:page])
  end
  
  def area
  end
  
  
  
  private
  
  def mountain_params
    params.require(:mountain).permit(:name, :area, :climbing_date, :height, :time, :distance, :height_difference, :view, :recommend, :fatigue, :comment, :route)
  end
end
