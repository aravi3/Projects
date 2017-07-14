class SubsController < ApplicationController
  before_action :require_login

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    require_moderator
    @sub = Sub.find(params[:id])
    render :edit
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
