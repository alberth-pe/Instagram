class PostsController < ApplicationController
    before_action :authenticate_user!
    def new
        @post = Post.new
    end
    def create
        @post = current_user.posts.build(post_params)
    
        if @post.save
          redirect_to @post, notice: 'Publicación creada exitosamente.'
        else
          render :new
        end
    end
    def show
        @post = Post.find(params[:id])
    end
    private

    def post_params
        params.require(:post).permit(:description, images: [])
    end

end
