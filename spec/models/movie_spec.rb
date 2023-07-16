require 'rails_helper'

RSpec.describe Movie, type: :model do

  let(:movie) { create(:movie) }

  context "it validates the presence of attributes" do

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:plot) }

  end

  context "it has associations with others models" do

    it { should have_many(:purchases) }

    it { should have_many(:users) }

    it { should have_many(:users).through(:purchases) }

  end

  context "it validates the uniqueness of attributes" do

    subject { create(:movie) }

    it { should validate_uniqueness_of(:title)}

  end

end
