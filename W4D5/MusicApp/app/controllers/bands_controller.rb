class BandsController < ApplicationController

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      # memorize @band.errors.full_messages method!!!
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end
