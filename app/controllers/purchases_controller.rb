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
    @purchase = @user.purchases.new(purchase_params)
    @purchase.purchased_at = Time.now

    unless @purchase.can_purchase?
      return render json: {error: "This content is still in your library. You can not buy it again"}, status: :unprocessable_entity
    end

    if @purchase.save
      render json: @purchase.as_json(only: [:user_id, :content_id, :content_type, :quality, :price, :purchased_at]), status: :created
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def purchase_params
    params.require(:purchase).permit(:user_id, :content_id, :content_type, :quality, :price, :purchased_at)
  end

end
