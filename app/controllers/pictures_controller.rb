class PicturesController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only:[:new,:create]
  before_action :correct_user, only: [:edit, :destroy]
  
  def index
    @pictures = Picture.all
  end
  
  def show
    @favorite=current_user.favorites.find_by(picture_id: @picture.id)
  end  
  
   def new
     if params[:back]
     @picture= Picture.new(picture_params)
   else
     @picture = Picture.new
     end
   end
   
  def edit
  end
  
  def create
    # binding.pry
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Pictre was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def confirm
    @picture = Picture.new(picture_params)
    #binding.pry
    @picture.user_id = current_user.id #現在ログインしているuserのidを、pictureのuser_idカラムに挿入する
    #binding.pry
    render :new if @picture.invalid?
  end
 
  def update
    respond_to do |format|
      #binding.pry
      if @picture.update(feed_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      #binding.pry
      @picture=Picture.find_by_id(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image, :image_cache, :title, :content, )
    end
    
    def correct_user
      picture = Picture.find(params[:id])
      unless current_user.id == picture.user.id
        redirect_to pictures_path
      end
    end
end

