class DiariesController < ApplicationController
  def index
    @diaries = Diary.default_order.page(params[:page])
  end

  def show
    @diary = Diary.find(params[:id])
  end
end
