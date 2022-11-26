# frozen_string_literal: true

class BlogController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @tags = Tag.all
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.author = User.last
    @post.summary = "@post.content[0..200]"
    @post.save!
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :category_id, :tags)
    end
end
