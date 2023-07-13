class PurchasesController < ApplicationController
  before_action :set_user

  def index
    @purchases = @user.purchases.select { |purchase| purchase.content_available? }

    if @purchases.any?
    render json: @purchases
    else
      render json: {error: "Content not available"}
    end
  end

  def create
    @purchase = @user.purchases.create(purchase_params)
    @purchase.purchased_at = Time.now

    if @purchase.save
      render json: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(1)
  end

  def purchase_params
    params.require(:purchase).permit(:content_id, :content_type, :quality, :price, :purchased_at)
  end

end
