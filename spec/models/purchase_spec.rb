require "rails_helper"

RSpec.describe Purchase, type: :model do

  let(:purchase) { create(:purchase) }

  context "it validates the presence of attributes" do

    it { should validate_presence_of(:user_id) }

    it { should validate_presence_of(:price) }

    it { should validate_presence_of(:quality) }

    it { should validate_presence_of(:purchased_at) }

    it { should validate_presence_of(:content_type) }

    it { should validate_presence_of(:content_id) }

  end

  context "it has relationship with other models" do

    it { should belong_to(:user) }

    it { should belong_to(:content) }

  end

  context "it has methods" do

    it { should respond_to(:content_available?) }

    it { should respond_to(:can_purchase?) }

  end

end
