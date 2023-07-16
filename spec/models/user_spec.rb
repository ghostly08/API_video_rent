require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  it { should validate_presence_of(:email) }

  context "it validates the uniqueness of attributes" do

      subject { create(:user) }

      it { should validate_uniqueness_of(:email) }

  end

  context "it has a relationship with other models" do

    it { should have_many(:purchases).dependent(:destroy) }

  end



end
