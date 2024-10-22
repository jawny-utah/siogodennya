class PostsController < ApplicationController
  before_action :assign_resources

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def assign_resources
    @resources = Post.all
  end
end
