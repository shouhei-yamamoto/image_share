class FeedsController < ApplicationController
  before_action :set_feed, only: %i[ show edit update destroy ]

  
  def index
    @feeds = Feed.all
  end

 
  def show
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
  end


  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @feed.save
        UserMailer.user_mail(@feed.user).deliver
        redirect_to feeds_path, notice: "画像を投稿しました！"
      else
        render :new
      end
    end 
  end


  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to feed_url(@feed), notice: "Feed was successfully updated." }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @feed.destroy
      respond_to do |format|
        format.html { redirect_to feeds_url, notice: "Feed was successfully destroyed." }
        format.json { head :no_content }
      end
  end
  

  private
  
    def set_feed
      @feed = Feed.find(params[:id])
    end

  
    def feed_params
      params.require(:feed).permit(:image, :image_cache, :user_id, :content)
    end
end
