class DirectorsController < ApplicationController
  before_action :set_director, only: [:edit, :update, :show, :destroy]

  def index
    @directors = Director.all.page(params[:page]).per(3)
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      redirect_to directors_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @director.update(director_params)
      redirect_to director_path
    else
      render 'edit'
    end
  end

  def destroy
    @director.destroy
    redirect_to directors_path
  end

  private

  def set_director
    @director = Director.find(params[:id])
  end

  def director_params
    params.require(:director).permit(
      :name,
      :country,
      :image
    )
  end
end
