class Users::LikesController < Users::ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    @like.save!
    redirect_to diaries_path, notice: 'goodしました'
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy!
    redirect_to diaries_path, notice: 'goodを取り消しました'
  end

  private

  def like_params
    params.require(:like).permit(:diary_id)
  end
end
