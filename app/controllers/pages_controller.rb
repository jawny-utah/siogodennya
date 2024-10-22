class PagesController < ApplicationController
  before_action :assign_resources

  def index
    @post = Post.first
  end

  private

  def assign_resources
    @resources = Post.all
  end
end
