class CatRentalRequestsController < ApplicationController

  def index
    @cat_rental_requests = CatRentalRequest.order(:start_date)
    @cats = Cat.all
    render :index
  end

  def new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)

    if @cat_rental_request.save
      render :show
    else
      redict_to cat_rental_requests_url
    end
  end

  def edit
    @cat_rental_request = selected_cat_rental_request
    render :edit
  end

  def update
    @cat_rental_request = selected_cat_rental_request

    if @cat_rental_request.update_attributes(cat_rental_request_params)
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end

  def show
    @cat_rental_requests = CatRentalRequest.order(:start_date)
    @cats = Cat.all
    render :show
  end

  def approve
    @request = selected_cat_rental_request
    @request.approve!
    redirect_to cat_url(@request.cat_id)
  end

  def deny
    @request = selected_cat_rental_request
    @request.deny!
    redirect_to cat_url(@request.cat_id)
  end

  private

  def selected_cat_rental_request
    CatRentalRequest.find_by(id: params[:id])
  end

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end
