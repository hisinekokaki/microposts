class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def edit #追加
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_url, alert: '不正なアクセスです'
    
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    unless @user == current_user
      redirect_to root_url, alert: '不正なアクセスです'
      
    else @user.update(user_params)
      redirect_to root_path , notice: '情報が更新されました。'
      
    end
  end
    
    
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user #　ここを修正
      else
        render 'new'
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :area, :profile)
      
    end
end

