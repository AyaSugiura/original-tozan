class SummitsController < ApplicationController
  
  
  before_action :require_manager_logged_in, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @summits = Summit.all.order('created_at DESC').page(params[:page]).per(3)
  end
  
  def new
    @summit = Summit.new
  end
  
  def create
    @summit = current_manager.summits.build(summit_params)
    if @summit.save
      flash[:success] = '頂上に写真を投稿しました。'
      redirect_to summits_path
    else
      @summits = current_manager.summits.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @summit = Summit.find(params[:id])
  end
 
  def update
    @summit = Summit.find(params[:id])
    if @summit.update(summit_params)
      flash[:success] = "頂上が更新されました"
      redirect_to summits_path
    else
      flash.now[:danger] = "更新に失敗しました"
    end
  end
  
  def destroy
    @summit = current_manager.summits.find_by(id: params[:id])
    @summit.destroy
    flash[:success] = "頂上の写真を削除しました"
    redirect_to summits_path
  end
  
  private
  
  def summit_params
    params.require(:summit).permit(:image, :comment)
  end
  
end