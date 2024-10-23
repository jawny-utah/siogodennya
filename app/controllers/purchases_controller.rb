class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.create(purchase_params)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:full_name, :phone_number, :city, :np_post_office, :comment, :product_id, :check)
  end
end
