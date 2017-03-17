class PostsController < ApplicationController
before_action :authenticate_user!, except: [ :show, :index ]
  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
      flash[:notice] = 'El post ha sido creado con éxito'
    else
      flash[:alert] = 'Algo fallo, el post no ha sido creado con éxito'
      render :new
    end
  end

  def edit
    @post =Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    flash[:notice] = 'El post ha sido actualizado con éxito'

    if @post.save
      redirect_to posts_path
    else
      render :edit
      flash[:alert] = 'Algo fallo, el post no ha sido actualizado con éxito'
    end
  end

  def destroy
    @post =Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'El post ha sido eliminado'
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def index
    @posts = Post.all
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:author, :title, :content)
  end
end
