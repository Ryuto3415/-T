class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @train = Train.all
  end

  def show
    @user = User.find(params[:id])
    @trains = @user.trains
  end

  def edit
    @user = User.find(params[:id])
  end

  # ユーザ情報の更新機能
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザーを正常に更新しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to root_path, notice: "退会が完了しました。ご利用ありがとうございました。"
    else
      redirect_to root_path, alert: "他のユーザーのアカウントは削除できません。"
    end
  end

  # ストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      flash[:alert] = "他のユーザの情報は編集できません。"
      redirect_to user_path(current_user.id)
    end
  end

end
