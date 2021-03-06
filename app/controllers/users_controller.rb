class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

 def index
  @user=User.all
 end
 
 def new
   @user=User.new
 end
 
 def create
   @user=User.new(user_params) 
    if @user.save
     redirect_to user_path(@user.id)
    else
     render 'new'
    end
 end
    
 def show
   @user=User.find(params[:id])
 end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :prof_image, :prof_content)
  end  
end

