require 'rails_helper'

RSpec.describe Season, type: :model do

  let(:season) { create(:season) }

  context "it validates the presence of attributes" do

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:plot) }

    it { should validate_presence_of(:number) }

  end

  context "it validates the uniqueness of attributes" do

    subject { create(:season) }

    it { should validate_uniqueness_of(:title) }

    it { should validate_uniqueness_of(:number) }

  end

  context "it has a relationship with other models" do

    it { should have_many(:users).through(:purchases) }

    it { should have_many(:episodes).dependent(:destroy) }

    it { should have_many(:purchases).dependent(:destroy) }

  end

end
