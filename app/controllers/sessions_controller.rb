class SessionsController < ApplicationController
  def new
    
  end

  def create
    #manager
    loginid = params[:session][:loginid]
    password = params[:session][:password]
    
    if login(loginid, password)
      flash[:success] = "管理人ログインに成功しました"
      redirect_to root_path
    else
      flash.now[:danger] = "管理人ログインに失敗しました"
      render "new"
    end
    
    #user
  end

  def destroy
    session[:manager_id] = nil
    flash[:success] = "管理人ログアウトしました"
    redirect_to root_url
  end
  
  private
  
  def login(loginid, password)
    @manager = Manager.find_by(loginid: loginid)
    if @manager && @manager.authenticate(password)
      session[:manager_id] = @manager.id
      return true
    else
      return false
    end
  end
end
