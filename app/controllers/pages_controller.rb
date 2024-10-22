class PagesController < ApplicationController
  before_action :assign_resources

  private

  def assign_resources
    @resources = Post.all
  end
end
