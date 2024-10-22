class PostsController < ApplicationController
  before_action :assign_resources

  def show
    @post = Post.active.find_by(id: params[:id])
    redirect_to root_path if @post.nil?
  end

  private

  def assign_resources
    @resources = Post.active.all
  end
end
