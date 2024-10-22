class ProductsController < ApplicationController
  before_action :assign_resources

  def show
    @product = Product.find_by(id: params[:id])
  end

  private

  def assign_resources
    @resources = Product.all
  end
end
