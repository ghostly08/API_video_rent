require "rails_helper"

RSpec.describe Purchase, type: :model do

  let(:purchase) { create(:purchase) }

  context "It has attributes" do

    it "return the purchase user_id" do
      expect(purchase.user_id).to eq(purchase.user_id)
    end

    it "return the purchase price" do
      expect(purchase.price).to eq(2.99)
    end

    it "return the purchase quality" do
      expect(purchase.quality).to eq("HD")
    end

    it "return the purchase purchased_at" do
      expect(purchase.purchased_at).to eq(purchase.purchased_at)
    end

    it "return the purchase content type" do
      expect(purchase.content_type).to eq("Movie")
    end

    it "return the purchase content id" do
      expect(purchase.content_id).to eq(purchase.content_id)
    end

  end

  context "it validates the presence of attributes" do

    it "user_id can't be blank" do
      expect(purchase.user_id).to_not be_nil
    end

    it "price can't be blank" do
      expect(purchase.price).to_not be_nil
    end

    it "quality can't be blank" do
      expect(purchase.quality).to_not be_nil
    end

    it "purchased_at can't be blank" do
      expect(purchase.purchased_at).to_not be_nil
    end

    it "content_type can't be blank" do
      expect(purchase.content_type).to_not be_nil
    end

    it "content_id can't be blank" do
      expect(purchase.content_id).to_not be_nil
    end

  end

  context "it has relationship with other models" do

    it "belongs to one user" do
      should respond_to(:user)
    end

    it "Could be a Movie or a Season throught Content" do
      should respond_to(:content)
    end

  end

  context "it has methods" do

    it "content_available?" do
      expect(purchase.content_available?).to eq(true)
    end

    it "can_purchase?" do
      expect(purchase.can_purchase?).to eq(false)
    end

  end

end
