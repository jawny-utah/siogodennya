class ProductsController < ApplicationController
  before_action :assign_resources

  def index
    @product = Product.first
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  private

  def assign_resources
    @resources = Product.all
  end
end
