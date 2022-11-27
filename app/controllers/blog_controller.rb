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
    post = Post.new(post_params)
    post.author = current_user
    post.save!
    redirect_to root_path
  end

  def like_post
    post = Post.find(params[:id])
    
    if post.liked_by.include?(current_user)
      post.liked_by.delete(current_user)
    else
      post.liked_by << current_user
    end
    post.save!
    redirect_to "/blog/#{post.id}"
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :category_id, :tags)
    end
end
