class CatRentalRequestsController < ApplicationController

  def selected_cat_rental_request
    CatRentalRequest.find_by(id: params[:id])
  end

  def new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_params)

    if @cat_rental_request.save
      # show user the cat index page
      redirect_to cat_url(@cat_rental_request.cat)
    else
      # show user the new cat rental form
      redirect_to new_cat_rental_request_url
    end
  end

  def approve
    request = CatRentalRequest.find_by(id: params[:id])
    request.approve!
    redirect_to cat_url(request.cat)
  end

  def deny
    request = CatRentalRequest.find_by(id: params[:id])
    request.deny!
    redirect_to cat_url(request.cat)
  end

  private

  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end



end
