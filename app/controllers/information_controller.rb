class InformationController < ApplicationController
  def new
    @information = Information.new
  end

  def create
    @information = current_manager.information.build(information_params)
    if @information.save
      flash[:success] = "お知らせを追加しました"
      redirect_to root_url
    else
      flash.now[:danger] = "お知らせを追加できませんでした"
      render :new
    end
  end

  def destroy
    @information = current_manager.information.find_by(id: params[:id])
    @information.destroy
    flash[:success] = "お知らせを削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def information_params
    params.require(:information).permit(:content)
  end
end
