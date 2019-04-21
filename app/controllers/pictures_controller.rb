class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  # before_action :logged_in, only: [:new, :create]
  before_action :correct_user, only: [:edit, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    #今ログインしているユーザーが、そのブログをお気に入り登録しているかどうか
    @favorite=current_user.favorites.find_by(picture_id: @picture.id)
  end

  # GET /pictures/new
  def new
    if params[:back]
    @picture = Picture.new(picture_params)
    else
    @picture=Picture.new
    end  
  end
  
  def confirm
     @picture = Picture.new(picture_params)
     @picture.user_id = current_user.id
     render :new if @picture.invalid?
  end
  
  
  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    @picture.user_id=current_user.id
    render :new if @blog.invalid?
    if @picture.save
    Picturemailer.picture_mail(@picture).deliver
    redirect_to picture_path, notice: 'Picture was successfully created.'

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
      end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # DELETE /pictures/1
  # DELETE /pictures/1.json
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
    @picture = Picture.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def picture_params
    # params.require(:picture).permit(:image, :image_cache,:name, :email, :content)
        params.require(:picture).permit(:image, :image_cache, :content, :title)
  end
    
  def correct_user
    picture=Picture.find_by(params:[id])
    unless current_user.id==picture.user.id
    redirect_to pictures_path
    end
  end
  end
end
