class TrainsController < ApplicationController
  # 新規投稿画面
  def new
    @train = Train.new
  end

  # 新期投稿機能
  def create
    @train = Train.new(train_params)
    @train.user_id = current_user.id
    if @train.save
      redirect_to train_path(@train), notice: "投稿できました"
    else
      render :new
    end
  end
  # 一覧表示
  def index
    @trains = Train.page(params[:page]).reverse_order.per(8)
  end
  # 詳細画面
  def show
    @train = Train.find(params[:id])
    @train_comment = TrainComment.new
    impressionist(@train)
  end
  # 編集画面
  def edit
    @train = Train.find(params[:id])
    unless @train.user == current_user
      redirect_to trains_path
    end
  end
  # 更新機能
  def update
    @train = Train.find(params[:id])
   if @train.update(train_params)
     flash[:notice] = "更新しました"
    redirect_to train_path(@train.id)
   else
    render :edit
   end
  end

  # 削除機能
  def destroy
    train = Train.find(params[:id])
    train.destroy
    redirect_to "/trains"
  end

  # ストロングパラメーター
  private

  def train_params
    params.require(:train).permit(:title, :image, :body)
  end

end
