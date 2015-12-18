class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def edit #追加
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path , notice: '情報が更新されました。'
    else render 'update'
      
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :area)
      
    end
end

