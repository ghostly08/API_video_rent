class PurchasesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    render json: @user.purchases
  end

  def create
    # @user = User.find(params[:user_id])
    @user = User.find(1)

    @purchase = @user.purchases.create(purchase_params)
    render json: @purchase
  end

  private

  def purchase_params
    params.require(:purchase).permit(:content_id, :content_type, :quality, :price, :purchase_at)
  end

end
