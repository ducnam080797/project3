class HomesController < ApplicationController
  before_action :load_home, only: %i(show edit update)

  def new
    @home = Home.new
  end

  def create
    @home = current_user.homes.build home_params

    if @home.save
      flash[:success] = t ".add_home_successful"
      redirect_to @home
    else
      flash[:danger] = t ".add_home_failure"
    end
  end

  def show; end
  
  def edit; end

  def update
    if @home.update home_params
      flash[:success] = t ".update_home_successful"
      redirect_to @story
    else
      flash[:danger] = t ".update_home_failure"
      render :edit
    end
  end

  def destroy
    if @home.destroy
      flash[:success] = t "home_deleted_successful"
      redirect_to root_path
    else
      flash.new[:danger] = t "home_delete_failed"
      render :show
    end
  end

  private

  def home_params
    params.require(:home).permit :name,
      :status, :cover_image, :description
  end

  def load_home
    @home = Home.find_by id: params[:id]
    return if @home 
    flash[:danger] = t ".Story_not_found"
    redirect_to root_path
  end
end