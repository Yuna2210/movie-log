class WorksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_work, only: [:edit, :update, :show, :destroy]

  def index
    # @works = Work.all.by_position
    # @works = Work.all.by_position.page(params[:page]).per(6)
    @q = Work.by_position.ransack(params[:q])
    @works = @q.result(distinct: true).page(params[:page]).per(9)
  end

  def new
    @work = Work.new
    # @work.director_id = params[:director_id] if params[:director_id].present?
    @work.director_id = params[:director_id].presence
  end

  def create
    @work = Work.new(work_params.merge(user_id: current_user.id))
    # @work.user_id = current_user.id
    if @work.save
      redirect_to works_path, notice: "You are successful to register new movie!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to work_path, notice: "This movie details have been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path, notice: "This movie has been deleted!"
  end

  def move_higher
    Work.find(params[:id]).move_higher
    redirect_to works_path
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(
      :title,
      :relese,
      :main_actor,
      :description,
      :director_id,
      :image,
      :remove_image,
      :image_cache,
      tag_ids: []
    )
  end
end
