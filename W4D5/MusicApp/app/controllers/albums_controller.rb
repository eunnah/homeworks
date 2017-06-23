class AlbumsController < ApplicationController

  def new
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      # memorize @album.errors.full_messages method!!!
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :category, :name)
  end

end
