class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new

  end

  def create
    blog = Blog.new(blog_params) #1,データを新規登録する為のインスタンス作成
    blog.save #2,データをデータベースに保存する為のsaveメソッド実行
    redirect_to blogs_path #3,blogs画面へリダイレクト
  end

  def edit
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
