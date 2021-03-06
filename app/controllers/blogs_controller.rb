class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new

  end

  def create
    @blog = Blog.new(blog_params) #1,データを新規登録する為のインスタンス作成
    if @blog.save  #2,データをデータベースに保存する為のsaveメソッド実行
      redirect_to blog_path(@blog.id) #3,blogs画面へリダイレクト
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end

