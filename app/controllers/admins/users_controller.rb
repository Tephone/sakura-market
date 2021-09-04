class Admins::UsersController < Admins::ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  
  def index
    @users = User.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admins_user_path(@user), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admins_users_path, notice: '削除しました'
  end

  private

  def user_params
    params.require(:user).permit %i[name email address]
  end

  def set_user
    @user = User.find(params[:id])
  end
end
