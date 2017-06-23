class TracksController < ApplicationController

  def new
    @albums = Album.all
    @track = Track.new
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      # memorize @track.errors.full_messages method!!!
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  private
  def track_params
    params.require(:track).permit(:category, :lyrics, :album_id, :name)
  end

end
