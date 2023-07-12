class PurchasesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    render json: @user.purchases
  end

  def create
    @user = User.find(1)

    @purchase = @user.purchases.create(purchase_params)
    @purchase.purchased_at = Time.now

    if @purchase.save
      render json: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:content_id, :content_type, :quality, :price, :purchased_at)
  end

end
