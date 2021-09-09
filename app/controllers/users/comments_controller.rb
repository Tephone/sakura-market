class Users::CommentsController < Users::ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to diary_path(@comment.diary), notice:'コメントしました'
    else
      @diary = @comment.diary
      render 'diaries/show'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    redirect_to diary_path(@comment.diary), notice:'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit %i[content diary_id]
  end
end
