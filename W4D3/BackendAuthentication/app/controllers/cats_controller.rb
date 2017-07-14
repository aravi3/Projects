class CatsController < ApplicationController
  before_action :owner?, only: [:edit, :update]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    # @cat = Cat.new(name: cat_params[:name], birth_date: cat_params[:birth_date], color: cat_params[:color], sex: cat_params[:sex], description: cat_params[:description], user_id: current_user.id)
    temp_param = cat_params.dup
    temp_param[:user_id] = current_user.id
    @cat = Cat.new(temp_param)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def owner?
    current_user.cats.each do |cat|
      return if cat.id == params[:id]
    end
    redirect_to cats_url
  end

  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
