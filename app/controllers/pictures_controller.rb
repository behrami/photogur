class PicturesController < ApplicationController

  before_action :ensure_logged_in, except: [:show, :index]
  before_action :ensure_user_owns_picture, except: [:show, :index]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures= Picture.all
  end

  def show
    @picture=Picture.find(params[:id])
  end

  def new
    @picture=Picture.new
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      #otherwise render new.tml.erb
      render :new
    end
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end

end
