class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @q = @tag.works.by_position.ransack(params[:q])
    @works = @q.result(distinct: true).page(params[:page]).per(9)
    render 'works/index'
  end
end
