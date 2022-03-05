class PostsController < ApplicationController
  def index
    @posts = Post.all
    @sum_posts = 'スケジュール合計：' + @posts.count.to_s
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :content))
    if @post.save
      flash[:notice] = 'スケジュールを新規登録しました'
      redirect_to :posts
    else
      flash.now[:alert] = 'スケジュールを登録出来ませんでした'
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :content))
      flash[:notice] = "スケジュールID「#{@post.id}」の情報を更新しました"
      redirect_to :posts
    else
      flash.now[:alert] = "スケジュールを更新出来ませんでした"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'スケジュールを削除しました'
    redirect_to :posts
  end
end
