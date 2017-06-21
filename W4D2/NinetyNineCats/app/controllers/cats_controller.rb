class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = selected_cat
    @rentals = @cat.rental_requests.order(:start_date)

    if @cat
      render :show
    else
      redirect_to cat_url
    end
  end

  def selected_cat
    Cat.find_by(id: params[:id])
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      # show user the cat show page
      redirect_to cat_url(@cat)
    else
      # show user the new cat form
      render :new
    end
  end

  def edit
   @cat = Cat.find_by(id: params[:id])
   render :edit
  end

 def update
   @cat = Cat.find_by(id: params[:id])

   if @cat.update_attributes(cat_params)
     redirect_to cat_url(@cat)
   else
     render :edit
   end
 end

  def persisted?
    @cat = selected_cat

    if @cat
      redirect_to cat_url(cat)
    else
      redirect_to cats_url
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end

end
