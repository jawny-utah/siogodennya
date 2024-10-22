class PagesController < ApplicationController
  before_action :assign_resources

  def index
    @post = Post.active.first
  end

  private

  def assign_resources
    @resources = Post.active.all
  end
end
